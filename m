Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9434C761AF
	for <phone-devel@archiver.kernel.org>; Fri, 31 Mar 2023 02:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjCaCAI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 30 Mar 2023 22:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjCaCAG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 30 Mar 2023 22:00:06 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A511116E
        for <phone-devel@vger.kernel.org>; Thu, 30 Mar 2023 19:00:00 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g17so27053681lfv.4
        for <phone-devel@vger.kernel.org>; Thu, 30 Mar 2023 19:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680227999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/Cs9N+JBNHHC68UN10KBHftx7PWk935ziMWBy68/UU=;
        b=y0+11ekoozy7ddS70UYGrYRiSq7iKD1xpNu2FDf+w7oshkJ2IM8w3ZDTyT6z2B1B/D
         /YL9W6TpsTZxkzQZf8Dl6ETruZWpwEl3uDpNPUrV59JrKpfcveUkl4Gc/nOP+gclwixq
         Jn45mCC/ikg2SgbvS9NkqM2cRtk5bg9b7zhvNELZgXYLN3qcDcc6uOzduy+P3euMRqdX
         RaH24TLSJesNd+NACqpXz/HkHCeRyaEU1ynCrX33DZBsbC3uFj7fC4hti2cur/nSUM1S
         LSHsVSx7/tqOTOnKB5z5HVN6eD/2VIAUfmjQOhP7jDEE/D/QrZ03blr37AYwemCHpMi7
         xPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680227999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Cs9N+JBNHHC68UN10KBHftx7PWk935ziMWBy68/UU=;
        b=V9NlRzvKQ1VyFMEZxX8teyp7huhYPkBueszjp4RXt+/tdYJUHjeQETeCVgZ9x42+FO
         803hajaCks/VgpKMdCk+HjKe6VS4MzVavIUG6hs/5j2TI3E2JB3qBikR6QRi/6cywsSI
         eUnRQ1x9hFsBHg90I7Dg4Z94oRI5QQuEnowGBh3RRKV8ge0zs6yuyKyoPodcFu40Pkby
         06ABmrqwhK6M+MOeC6OGfbO5fJoTRTEzMO+bhmweDd58/DZEUM9Uf/6F6BREU/aw/9Os
         Mk5y+KPNSypWbFBgOsyU+lLMCkxgGw9tO+SRhesapatADoT/i51cZYEmECuu9mfj2bcC
         IqVA==
X-Gm-Message-State: AAQBX9diFqFrcPTxbMpK5zKyEgpP7P/vTU515+8WlEXX6D2xSWsPeYDP
        orgHZN2smiSyAsG/2utrSKb3iQ==
X-Google-Smtp-Source: AKy350atLJ9EP2srAoTJvjirAAVV59z6TRpyvHABLEzzCXDLX1sakEK7UHARpa3ykAYY1IbpVGgZgA==
X-Received: by 2002:ac2:515e:0:b0:4e2:cb9:e266 with SMTP id q30-20020ac2515e000000b004e20cb9e266mr7130104lfd.50.1680227999049;
        Thu, 30 Mar 2023 18:59:59 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id x9-20020a19f609000000b004db51387ad6sm168515lfe.129.2023.03.30.18.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 18:59:58 -0700 (PDT)
Message-ID: <4ffea89c-7b8d-7a3a-4c8a-e5f4dfb9bbcf@linaro.org>
Date:   Fri, 31 Mar 2023 03:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/4] dts: arm64: qcom: sdm845-shift-axolotl: enable
 SLPI
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230330165322.118279-1-me@dylanvanassche.be>
 <20230330165322.118279-5-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330165322.118279-5-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 30.03.2023 18:53, Dylan Van Assche wrote:
> Enable the SLPI DSP on the SHIFTPHONES SHIFT6mq phone with a
> Qualcomm SDM845 SoC.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index b54e304abf71..bd9571a258cf 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -572,6 +572,11 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/axolotl/slpi.mbn";
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
