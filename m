Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F4EC77B73
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 21:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242754AbjEZVjw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 May 2023 17:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjEZVjr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 May 2023 17:39:47 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A62D9
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 14:39:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so8585195e9.1
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137184; x=1687729184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fr38gHrovEqvIDVjmJUcVz1yHKs2a68amocFg0XW5+I=;
        b=mz6LhGw+L2b0oy3zfwNffZyMgRGm9NTPoy9n3vmtvsi6I6X2OPbTFsn16Buj+rejy/
         Cl7n2yFtUdwBry6q/owM30XjthCsMRRiSQzo1b5UY67Uh1drhST2zZN+8mcOOa3OCMaY
         nHlLgHqYIafBxn6n/RAmvfOgoIu9B1QzXshPZA1Y1F4ag79LNriTaS8uspFNLio43U0b
         e0yuR1W123rZQ8hFiHdfMJuU2TbSSkr7nMAiC4NaDlYjmdhCxfU5yWMPJQ6RKOXGp8ue
         OddpvLlaCzmVC8dgFq3UPcFOG7fwZ5aNskTrsMrdyFJQ04f25Crstlgh+m3lZe3FNDhc
         laBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137184; x=1687729184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr38gHrovEqvIDVjmJUcVz1yHKs2a68amocFg0XW5+I=;
        b=EtC0uNtRCZrxSh7gMoVftCiD+hFVLOIwH9dZtlWfH7K8bzikwwfz9R/Q3r3zWIRpvt
         xTeYgrI3QpM6g1V82GIlTGMb74AGrgQ6pl1+9m4zdMs+YlbvZP2wH/aAtrJCRYL2ZhXS
         B3rA4ZL11IhOdqqN1U1d3bC3F0VdZPnJSi84vfwqYIKtdTuXV6s0PyT6KVS8MSo+cxuI
         6Ruts2wPjLClKrXobaeS/baIwoYiMSq7DL/F5p62EsrMTvtYn/kv7Zvj58VMvfPOKrfx
         ixnC6fB17P1Jxo7TzbyHdHUmaGBeAO6RoAFNMIBDUZJLskp+SjaprqcW7GaOHv1+AYwk
         W9WQ==
X-Gm-Message-State: AC+VfDx2zlSnO33z0/br/YChFCsbaMDQv3Mx/yfNzuCgsNCduif5kS0L
        TKeTUON5U2cxV3BnCFPSj25czQ==
X-Google-Smtp-Source: ACHHUZ6sb0RcvontvHGTFeeFVWpYWfP6XcpLXn2gIyOgReaEDFza2qOvrIhPKacGPWqidQpHseAAUg==
X-Received: by 2002:a7b:c4d9:0:b0:3f6:244:55e3 with SMTP id g25-20020a7bc4d9000000b003f6024455e3mr2177603wmk.35.1685137184171;
        Fri, 26 May 2023 14:39:44 -0700 (PDT)
Received: from [192.168.0.79] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id n26-20020a7bcbda000000b003f60482024fsm6346053wmi.30.2023.05.26.14.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 14:39:43 -0700 (PDT)
Message-ID: <869ed07a-1f9c-75dc-8250-e9533f3d5b88@linaro.org>
Date:   Fri, 26 May 2023 22:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi8998: add charger node
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
 <e7786af1-f19d-abb4-59ce-d08fb25bd091@linaro.org>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <e7786af1-f19d-abb4-59ce-d08fb25bd091@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 26/05/2023 20:46, Konrad Dybcio wrote:
> 
> 
> On 24.05.2023 19:38, Caleb Connolly wrote:
>> Add a node for the smb2 charger hardware found on the pmi8998 pmic
>> following the DT bindings.
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>> index be6f60bfc26c..73f51451d21d 100644
>> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
>> @@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>>  
>> +		pmi8998_charger: charger@1000 {
>> +			compatible = "qcom,pmi8998-charger";
>> +			reg = <0x1000>;
>> +
>> +			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
>> +				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
>> +				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "usb-plugin",
>> +					  "bat-ov",
>> +					  "wdog-bark",
>> +					  "usbin-icl-change";
>> +
>> +			io-channels = <&pmi8998_rradc 3>,
>> +				      <&pmi8998_rradc 4>;
>> +			io-channel-names = "usbin_i", "usbin_v";
> Are these hard-wired internally?

Yes, features like AICL (automatic input current limiting - where the
device pulls more and more current until the input voltage drops) are
run autonomously and dont rely on the driver to tell the charger block
what the readings are.

This is only used to expose the voltage/current values to userspace via
the standard psy interface.
> 
> Konrad
>> +
>> +			status = "disabled";
>> +		};
>> +
>>  		pmi8998_gpios: gpio@c000 {
>>  			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
>>  			reg = <0xc000>;
>>

-- 
// Caleb (they/them)
