Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCC0C4332F
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 14:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLQO0g (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 09:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLQO0d (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 09:26:33 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0482BEA
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:26:32 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b13so7662708lfo.3
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBAKrjDZYKHFqaH+bhTLGRxiFMBbEG5xtL60jtUJAKM=;
        b=gywXYnrfjsKLBObQQ6iBg7dyeQ3ijk6LEVXks5bA3S4bqCtRj1MFc7SBM22phmv3+V
         JY9qIyS75xlwMMFGh/9m5SSpd0kexE4aIf7k8ndoEmJ2EeUrYgfRXRVwlJDpaRDSqnxG
         RKFTd2cVO9QMOOzfb++WKJs9qUn61IK7E4xKgPe9wqwZUEigw4oyxvaCP1TQFZ+mD2zx
         uXtzZh7H19OqwYySihXytiXTYXYnmseN9SPRCnTfdgR4cQIlPEzaopd55wx0VUsvlfCH
         u9ei7bvXko8xCxWXRFsehK1DcZzHIQq15rSEhK2q+79cqff00OfwLAjsAgHwsRc+Nsn4
         vqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBAKrjDZYKHFqaH+bhTLGRxiFMBbEG5xtL60jtUJAKM=;
        b=LaJyludbSfpN5t5xxYazlfwx4CbRSxwSAV44wn8a73LkG6IWC7ac9JNdPQejsOW/2Q
         XXgiOiN2SYPcJD8P4tlCXg/0Wu4JOU9sm9ZbZdw5+Rcm+5k/wQikL7gd6Jz+BOxKbrFf
         t/9dqWYILeFstLNLlX56KSGg2rf/uEd71W6FrmnvoPQP8klvPuVlVtqtElmxZ6tkurnQ
         Wxn9LhUBOETkXJUToyL4VsDFeSejf0bLHGQM0kY88KWIw+EN4EydTJbuKA8CuVlemCwT
         rKsxBqjgrrb9ecD28kbrBeBglD1kowa/OSNLGj7bKMA+dQ8nEvSHQ4BMevRhDzHIay50
         1cUQ==
X-Gm-Message-State: ANoB5pnx2Mvl16CkRVchLPGx6XKZBDSErOd1OCI50eh6lM07OMDgsg3e
        WrRxpBqzDT5Umr4Mivbf9KM/QA==
X-Google-Smtp-Source: AA0mqf55sZ4jYPjQE6FoBxDnkmA7yvGnr8Y7/eIk+HTyHrPehRgHqwh1i4HPTHgawf847d1gITQBWA==
X-Received: by 2002:a05:6512:3f89:b0:4b1:af78:a657 with SMTP id x9-20020a0565123f8900b004b1af78a657mr12797344lfa.30.1671287192328;
        Sat, 17 Dec 2022 06:26:32 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c22-20020ac25f76000000b00492e3a8366esm529573lfc.9.2022.12.17.06.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 06:26:31 -0800 (PST)
Message-ID: <19b09eff-705a-5522-fbad-6553e5dd391e@linaro.org>
Date:   Sat, 17 Dec 2022 15:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sm6125: Add IOMMU context to
 DWC3
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221216215819.1164973-1-marijn.suijten@somainline.org>
 <20221216215819.1164973-5-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216215819.1164973-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 16.12.2022 22:58, Marijn Suijten wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Add an IOMMU context to the USB DWC3 controller, required to get USB
> functionality upon enablement of apps_smmu.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index f560499cc0ca..a205121ab4a7 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -542,6 +542,7 @@ usb3_dwc3: usb@4e00000 {
>  				compatible = "snps,dwc3";
>  				reg = <0x04e00000 0xcd00>;
>  				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x100 0x0>;
>  				phys = <&hsusb_phy1>;
>  				phy-names = "usb2-phy";
>  				snps,dis_u2_susphy_quirk;
