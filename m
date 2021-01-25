Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B5DC433E9
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 05:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99EA1221EA
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 05:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbhAZF7L (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:59:11 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:20619 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbhAYKNY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 25 Jan 2021 05:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611569227;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
        Subject:Sender;
        bh=/pQs1UTSU8NSB7mRfB8RlJZdZ2fKeEBAAIz/2cLj9Tw=;
        b=UyxYqe2M5YG7v7fe90gyZFldrQy/iVcLbWogXFce6/sXJHP6+bESS/mANHsTCf5ysT
        hj5SdPHfksh3nCx5wrANcA7jYcGZ/dhiSXua1wq+3Niyl1U/55PX3g/gesGdUixqb7YU
        F6MjOK4H+4+c5KTv5WFfOj8XK82zd7DzHGSF3o84wO+4IGghXWGhy0hPFhGvmFUJXS28
        CN1AcrdPsfoOTofWaw0W+p/MQNky0q3lFjrsurxh7rdm7VPCpuO6PFdJJYckTklG01Uk
        Wz3rHPIsbWkHY65UwUpyk0aCCmI2dxw2akgPFBu7o01qd8nlNr3VJX8MESvyNTiULFFR
        5RDw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczEaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x0PA72kv7
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 25 Jan 2021 11:07:02 +0100 (CET)
Date:   Mon, 25 Jan 2021 11:06:56 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jonathan Albrieux <jonathan.albrieux@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8916-longcheer-l8910: Add
 imu/magnetometer
Message-ID: <YA6YQMHDk4Nx1dDE@gerhold.net>
References: <20210125094435.7528-1-jonathan.albrieux@gmail.com>
 <20210125094435.7528-4-jonathan.albrieux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125094435.7528-4-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jan 25, 2021 at 10:44:32AM +0100, Jonathan Albrieux wrote:
> BQ Aquaris X5 (Longcheer L8910) has:
>  - BMI160 accelerometer and gyroscope sensor
>  - AK09911 magnetometer sensor
> Add them to the device tree.
> 
> This patch depends on patch "arm64: dts: qcom: msm8916: Add blsp_i2c3".
> 
> Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../boot/dts/qcom/msm8916-longcheer-l8910.dts | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> index 7d5eff922f41..27845189ac2b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> @@ -56,6 +56,35 @@
>  	};
>  };
>  
> +&blsp_i2c3 {
> +	status = "okay";
> +
> +	magnetometer@d {
> +		compatible = "asahi-kasei,ak09911";
> +		reg = <0x0d>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vid-supply = <&pm8916_l6>;
> +
> +		reset-gpios = <&msmgpio 111 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mag_reset_default>;
> +	};
> +
> +	imu@68 {
> +		compatible = "bosch,bmi160";
> +		reg = <0x68>;
> +
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +
> +		mount-matrix = "0", "1", "0",
> +			      "-1", "0", "0",
> +			       "0", "0", "1";
> +	};
> +};
> +
>  &blsp1_uart2 {
>  	status = "okay";
>  };
> @@ -220,6 +249,14 @@
>  		bias-pull-up;
>  	};
>  
> +	mag_reset_default: mag-reset-default {
> +		pins = "gpio111";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	usb_id_default: usb-id-default {
>  		pins = "gpio110";
>  		function = "gpio";
> -- 
> 2.17.1
> 
