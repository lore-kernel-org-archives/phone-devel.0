Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4A2C76196
	for <phone-devel@archiver.kernel.org>; Thu, 23 Mar 2023 16:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjCWQRE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 23 Mar 2023 12:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjCWQQr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 23 Mar 2023 12:16:47 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D34C36687
        for <phone-devel@vger.kernel.org>; Thu, 23 Mar 2023 09:16:29 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 20so15962251lju.0
        for <phone-devel@vger.kernel.org>; Thu, 23 Mar 2023 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679588187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryTu6zaCoI2WK0bZO1AkabKmhlUxG/TKoy8qClCDl3s=;
        b=X35gckylit4clnuJCHYArzsheet/i/G//qUBdWpgiz31svNxTKw9uIF1ce96dYHrlU
         wf7biuyvGZzW053nOjPU1al8iq2TEIaOjAhWhFLmmy95b9hECCRdLK0c0/9lxE6mKP68
         U89tN/BuLAy3Vywj+ZvVTaC0F31vOv8SQeHbqLa7KhNM0qorUpUhH7p3/NgsdZ868WHt
         A1D5EN90vgs2q9aMIlvpLwv+YGmM9OkoVlRTu+cydBGjgotNsqN4UpaL2cWxjJu9rPC0
         mBPsVsIhzTWugKDz3+exNLswtjqD34cgyxAx17qiCiWVVnZHydRHF6LC7OL9rwbSJ76k
         7+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679588187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryTu6zaCoI2WK0bZO1AkabKmhlUxG/TKoy8qClCDl3s=;
        b=jEpOpNaeiOaEzIyB35P1iVbsLTGZeUhZudAb7ifdq276K4+bGjbEMpigkrHXKrD4sK
         Vii2oFmGl/irXMSPjrPFTQ7G/Aa/FfYrwewcW/CiGsT5GdEMJUAG6Hg5yb6C9XOgQG8f
         Z/F6QWauB7s4/NLKEsN8opWRJ0kT8HmricvObRQfH2iX34I2O/ULCAkRr3ppRtqJRZ+w
         VfVrQ+b5Ur+dPWnj1WCLgjVuhVLfPPpfKWGtSLUmthTc+LSf1FWQzjdfjSngd+XhkdfB
         afCq8GmwJKmBjnRLEw733JZVt/ckaibX4yf62XBAe5VwG9tLDRuvI8rjGQsa/aZaJ2Dx
         z82A==
X-Gm-Message-State: AO0yUKWPsoxEE+VTxVQo5bTkioMb1Q5TMmcW9mzZR4wPiFg5zUgk1d9B
        l4znS061aOmSbqIwej/rdIh5Fw==
X-Google-Smtp-Source: AK7set9Y4cajNDfcbllrzFUVHfIvE/fAcRhK+cwjghBUW380/gIDvSK6YWOY/ErBaBnPUCnkf5w9Qg==
X-Received: by 2002:a2e:6a0d:0:b0:2a0:51b4:855b with SMTP id f13-20020a2e6a0d000000b002a051b4855bmr2371646ljc.18.1679588187317;
        Thu, 23 Mar 2023 09:16:27 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id a1-20020a05651c010100b00298a8527806sm3070801ljb.93.2023.03.23.09.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 09:16:26 -0700 (PDT)
Message-ID: <146cd9ba-5646-2033-0f46-ab7cab5d6b86@linaro.org>
Date:   Thu, 23 Mar 2023 17:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish-boe: Add
 mdss and dsi panel
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230323005925.23179-1-lujianhua000@gmail.com>
 <20230323005925.23179-2-lujianhua000@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230323005925.23179-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 23.03.2023 01:59, Jianhua Lu wrote:
> Add nodes for BOE NT36523 panel found in xiaomi-elish. This panel
> is a dual dsi mode panel and the dsi phy type is cphy.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in v2:
>   - Include missing <dt-bindings/phy/phy.h> for phy-type property.
> 
> Changes in v3:
>   - Sort include header.
>   - Move qcom,sync-dual-dsi to the front of qcom,master-dsi 
>   - Add newline before subnode.
> 
>  .../boot/dts/qcom/sm8250-xiaomi-elish-boe.dts |  5 ++
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 75 +++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> index bd9ad109daf9..8b2ae39950ff 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> @@ -11,3 +11,8 @@ / {
>  	model = "Xiaomi Mi Pad 5 Pro (BOE)";
>  	compatible = "xiaomi,elish", "qcom,sm8250";
>  };
> +
> +&display_panel {
> +	compatible = "xiaomi,elish-boe-nt36523";
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index a43d4b73ffca..4585f61781f1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/arm/qcom,ids.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
> @@ -469,6 +470,76 @@ &cdsp {
>  	status = "okay";
>  };
>  
> +&dsi0 {
> +	vdda-supply = <&vreg_l9a_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	qcom,master-dsi;
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		vddio-supply = <&vreg_l14a_1p88>;
> +		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +		backlight = <&backlight>;
> +
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				panel_in_0: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1{
> +				reg = <1>;
> +
> +				panel_in_1: endpoint {
> +					remote-endpoint = <&dsi1_out>;
> +				};
> +			};
> +
> +		};
> +	};
> +};
> +
> +&dsi0_out {
> +	data-lanes = <0 1 2>;
> +	remote-endpoint = <&panel_in_0>;
> +};
> +
> +&dsi0_phy {
> +	vdds-supply = <&vreg_l5a_0p88>;
> +	phy-type = <PHY_TYPE_CPHY>;
> +	status = "okay";
> +};
> +
> +&dsi1 {
> +	vdda-supply = <&vreg_l9a_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +	status = "okay";
> +};
> +
> +&dsi1_out {
> +	data-lanes = <0 1 2>;
> +	remote-endpoint = <&panel_in_1>;
> +};
> +
> +&dsi1_phy {
> +	vdds-supply = <&vreg_l5a_0p88>;
> +	phy-type = <PHY_TYPE_CPHY>;
> +	status = "okay";
> +};
> +
>  &gmu {
>  	status = "okay";
>  };
> @@ -533,6 +604,10 @@ fuel-gauge@55 {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
