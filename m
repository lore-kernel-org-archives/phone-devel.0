Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA90E71D38
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 13:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjI2NfV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 09:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbjI2NfU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 09:35:20 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF681AC
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 06:35:17 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so1970516266b.1
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994515; x=1696599315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlAAhroIKSpL8+fyShtvqU4a0850NAbVSPJtR3BZY+4=;
        b=WaY5wUNgvCKUIzxujyB0gQfeq17jhI3LlZKWLsy+fDvAe73SivI9fxvp4GLq0qzpk0
         4vH9TIaVczXttp7p5Z8xzHnJL3e3Hc0LZhvwtBOWnrNrT2qztL7/YooxSDME9fhAHTFs
         tA59MT75IlhbKs8+z283q2ddFZ154mSYrtfgvjbjEaWnN59nbm/Ne7d73CoYFcwiTDlQ
         g19ZsszQsne5pTN6b1UjFlL2fB2cag1bQEC/rVfEz8npNLCyYqVyCrf3E5CywAyU/nHk
         Knurg91QzrwLPv/vpu8i9f/fiY9VxblPKNiMdkfFVvLulfSakoorttimMKm3gMtAIakO
         qrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994515; x=1696599315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlAAhroIKSpL8+fyShtvqU4a0850NAbVSPJtR3BZY+4=;
        b=HtRtxUN5t7RhBd3RDtC+Zmz+U4hByopb61oTS2MYBwKavuaWJZxD+Qr/Z8x9uFu1gt
         2F2w2u9xsLCNJ+kLNf81ME5ZgaJj8BjkfR1LmX/i9gd7RK/kS4OqH1OjIrY4B/S2pE49
         cYSEG5xJCjCUfH1pwf+urRXIPcGQlHeK29rod1rjgrHIKM+vSm0KPYaZf2puygQRls5t
         ModyzjlnhgUL0emjtmo1E+n5uW6fEHaxdkUHvj7OpzRZ4tS3SCqWw5IpKLORcKFxRNPy
         XOt/Ifp0/hs8Q8W9MypCnoC/ncuqzzMNBP1FIhrpO4auksEJBFV5t9itff1Qc95ybeUF
         6arQ==
X-Gm-Message-State: AOJu0YyrEmOER0j5XCkLZKHqS2z6UhA1cPw6qB4Tm2QM2HC1UR/eCMOv
        oDCSP2a5JNF0YS8A/5iNbSYsXA==
X-Google-Smtp-Source: AGHT+IFB0gWCRdIz3y4FpDLEeFeD/l2I4205KcVLY5FFCUf6mhKQfziV+cURqsALwr4kjpJ9713mCQ==
X-Received: by 2002:a17:906:2189:b0:9b2:7584:80dc with SMTP id 9-20020a170906218900b009b2758480dcmr3707193eju.20.1695994515614;
        Fri, 29 Sep 2023 06:35:15 -0700 (PDT)
Received: from [192.168.0.123] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b009a193a5acffsm12231752ejk.121.2023.09.29.06.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 06:35:15 -0700 (PDT)
Message-ID: <8dd470e5-ce33-3d33-98f1-e66935ca7b56@linaro.org>
Date:   Fri, 29 Sep 2023 15:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Add Camera Control
 Interface busses
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-2-16c7d386f062@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230929-sc7280-cci-v1-2-16c7d386f062@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 9/29/23 10:01, Luca Weiss wrote:
> Add the CCI busses found on sc7280 and their pinctrl states.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 136 +++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 66f1eb83cca7..65550de2e4ff 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3793,6 +3793,86 @@ videocc: clock-controller@aaf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac4a000 {
> +			compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac4a000 0 0x1000>;
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
I guess this is more of a question to e.g. Bryan, but are all of these 
clocks actually necessary?

Konrad
