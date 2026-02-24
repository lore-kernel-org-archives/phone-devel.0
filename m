Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73426F296
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 03:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902829; cv=none; b=ujfzVjLzNs1Blo6DwAxWusP99a63GgPhSyMu7GkWm5EzuZLlSufDoR228mD5xHvWuHVmMDWTNJ1P4wn1gTafB4NEoiMXo0kaTln7l/aFU7dv22KNshDhgLDd5H1qsJaqNVQxraP7RFRzxw/zVcvb/dS4fBGwqFYXSfDrfONN7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902829; c=relaxed/simple;
	bh=LcV5Lc4mojMXAZUNqSsUxVXfwsDweWbE3sIONjorS24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAdKClog3chdUqD9F6DQ+qviVD6EJQaGq1AvxR90OAM6J1y8IXt8Kg36yCakdX6jrsyHfk8smNV6ZXoCJk1Wu2/kfMCCmmsBQvi63k/1pymZd5T5f1rdmvZrJfZX+3bvC5qpanqy09++TOd2q2rnu4GA3LaZESk/tIJxSoeohbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nElXYjXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBIoTmCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nElXYjXK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBIoTmCA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O2lwE61556495
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 03:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oHnHqvAlVSl5cCBuKPP78rBW
	oru4kbEhnt7agre2pD0=; b=nElXYjXKtdusdRYVb8qq63RSdCRUKbcBS8YYYXIf
	7ENQ766uGpXtuv6MfXkaNL3niZtoIPPtC6w358jV1q5Du7z6T8X90s6DR3xgYqK6
	uzuGG2tpWI6efqF0qCqEBX8rxtMGXycD++H8OM36wIWIh+p3YgTGz5Ga4jWbcJTZ
	ZuDzlPNcN2aV33WVydtxaoIg+K+X1Cp2Ikd/PcIbUaXZxijsJTndKM2EctPqpylS
	O8Ed9BUAq1wo4d3u3PDk+f/w7gnbJiXHkjPLAxMMY3R+8iG0ybVFYINP3ZbmMUGr
	jQlnU+pzz//yp978bQ61Pp97Lody0jobYwPzQ7EHt/IcBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn81apv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 03:13:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so4312973485a.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 19:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771902827; x=1772507627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oHnHqvAlVSl5cCBuKPP78rBWoru4kbEhnt7agre2pD0=;
        b=fBIoTmCAD9UjSPVwmzG5SZFmDDDn8IWGoEq8oBbdV+BGCgVssE5In+9Ou3ACpIbFja
         Ip0a8Fv5/ZW7gs60vwCzzSxaWyLrxKY+NksGO8xtGag23bW7HDMZPXrLQIE6/021wu2V
         amB7hKvP+vBw+2a9P2LTkqVlFRmrQgt6hC4Eb9C7Ypc+zBJqVcSPoj2F9uNRDgMGccwD
         rFG8pWVhjVRSt3DNDqrxFU0gYSV4TD8Y/AFCYc4FirB58bBf5bc9BKYakHFbQKnVvAjo
         63sALjm0N9K7BMmUxFgYK1w5sdMqZEKKrej+bk4uUUu6XGPO2FBBn5125SprGaq1Mrrg
         4K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771902827; x=1772507627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHnHqvAlVSl5cCBuKPP78rBWoru4kbEhnt7agre2pD0=;
        b=rEvAx2a6mUxBevEz5qPF4TMpdP/b+pT5mg4IvPt1WQ8VE09cgNCQ9thU1rLz/PsMXD
         RbCheGNoqtO/LlfkEPQVxfMniOiT4Y5L0NJXhO3yvoIkFV28hsnD69mrcoot/qVu7BTR
         aLwW+s3/DKxFeF0UXwaf2cURJ9y1SEhUp2syNaAkTokDHeDLC8t83/xzk+/e+IXHfTiu
         kwWpfd0oRcN+VfyjPl7xk6Lua+eRWsc+M/1iRlWmGdtzzSHFkkEKNQDaL97Ebr5WKk4T
         eOlZ0UCxJ5dXdeoTjtubxXaG+h7YmpYoxI+tGICoHPJLTELg7SlTMoKj5pluMW+EqIpc
         lvew==
X-Forwarded-Encrypted: i=1; AJvYcCVt/7aFIVJDuuaclRbLgZENy/cmzWXgMmlQ04S45uqfcswPV5Vueraz5y9PbyFUy6TE+OrR/t+aqO0YqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF7nGtWdfSFReQbx8N3JhUdsNh5H0EblS9O9or+rj0Wm3AaHzo
	Asjj/H0dTOBtT4x+j0e2fUh+9Bg4PYaNtGJhv7Beop1ztk999H1zRyJXWI8HVaHoSqEdgmqCI/T
	VE6NaheEk8zVJc9/6IovRydEYPYjM1NT1FyyesbG6sWfnWbhq/McsVHnDisqk0X4jiA==
X-Gm-Gg: AZuq6aLDErbUaE8zOpK8KptbDrlVaJLhaRE5YIP3x9AHg5xBiwHNYROO7OmCsqOBskU
	oVh+DvNplxSq6cPuYsr2KBU6jqNmfWx/RAcMOJ2RLiys52y7myouMlP1a9lsnzEAwoS+ieyrAAn
	/C5Krh/kTs+k4a1O5sQSuHuJPqUieF3AKs1p1amr+q1xSxnvc36rM11c6dYX5310QsseL9X3o3k
	BCHYlz0Rrm2iwPwF8/wVUSLgCKyCxWtxMIZb4nzFlecDlbW/5//WvlUauAiBlqfVhsve/3zzRyh
	l8bjYFufFZOKxlZ9T/LBcXmY98VsmWcno57XtnnxzFCIzBygx2tzReGahpTllpBHV5sh+/4tbAZ
	ZybCfnVKBSCy5PFafPCKByEOYpA7YHqZfOimLClvXZMHS0+zVZnuhpgzRMGg71VBN5XB7mAL/Wo
	yRlB0FrOGbKheYGJaa+8YyFd1xKzfV9kfBLPI=
X-Received: by 2002:a05:620a:199c:b0:8c6:a723:415a with SMTP id af79cd13be357-8cb8c9cdc40mr1386784485a.11.1771902826659;
        Mon, 23 Feb 2026 19:13:46 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c6:a723:415a with SMTP id af79cd13be357-8cb8c9cdc40mr1386782685a.11.1771902826154;
        Mon, 23 Feb 2026 19:13:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b930sm1935855e87.5.2026.02.23.19.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 19:13:45 -0800 (PST)
Date: Tue, 24 Feb 2026 05:13:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: adamp@posteo.de
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <smephvi2ldk2n22ylbvkfjnkitynv4i36zrn4rhyay6ixeykn6@qp27umfdr4xm>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
 <20260221-wiko-chuppito-v2-3-6336b1b12389@posteo.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221-wiko-chuppito-v2-3-6336b1b12389@posteo.de>
X-Proofpoint-GUID: 8f2KbGYSJLyKXxukAKvqQWCuX5PP8_ZK
X-Proofpoint-ORIG-GUID: 8f2KbGYSJLyKXxukAKvqQWCuX5PP8_ZK
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699d176b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Dh4An6xqnM-8EQvk768A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyNSBTYWx0ZWRfX5pVSlzJz7gWr
 5F9yOayiiVtjqkUWKMGRw2nd2v8q/bznT2VD/yOy8oSjcADTkIuCR9XCWlMNmodnLRXAmnMvZ5h
 2CXs3W0UC+F/lrylBQMOeM8+dDiL9Gu6MnCMBUpyWZ4QcJbyYmW4KaiwqmEqiXMDDYlpeMAYu1y
 P9IpwbeOv0vY8DyukPLDTQkZvevA6sKIeqfSc/DErW8GhmFakDg1+cdcrEaJALXeFO2MMzXJ/5p
 V7Ms2iBHFyPKlmPo37wapCxvnE/ho4h2M1Anq4bFb6BCRJWYzA32YsfPaFp9MiR/cjtZACiX/Dh
 vrJGcCCMNiNGWQVP1Ec6+5G4DhBSI8+Ohsv/GtbY41im82whu5mF6w2EJLenIw8LyFOYYF7B2hz
 0XHCfP9q3GJXMD58GmWT/4a+u7W/vS73mCQkNZ9uX9pU/kR9qSEg5xroerR72dRZfQbYnjVm27y
 5o7SoWwZzIhio9Wmi9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240025

On Sat, Feb 21, 2026 at 09:55:41PM +0100, Paul Adam via B4 Relay wrote:
> From: Paul Adam <adamp@posteo.de>
> 
> Add an initial device tree for Wiko PULP 4G.
> Includes support for:
> - UART
> - USB (no OTG)
> - Internal storage
> - MicroSD
> - Volume keys + Power button
> - Touchscreen
> - Backlight
> - Accelerometer: Invensense MPU6880
> - Magnetometer: Asahi Kasei AK09911
> - Hall sensor: Rohm BU52021HFV
> - Proximity sensor
> - Vibrator
> - Earpiece
> - Microphone 1
> - Headphones
> - Wifi
> - Bluetooth
> - GPU
> 
> Signed-off-by: Paul Adam <adamp@posteo.de>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 361 +++++++++++++++++++++
>  2 files changed, 362 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..5a3a9a823503 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -75,6 +75,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-rossa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-uf896.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wiko-chuppito.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> new file mode 100644
> index 000000000000..7f3a48e3bcb9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8916-pm8916.dtsi"
> +#include "msm8916-modem-qdsp6.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> +
> +/ {
> +	model = "Wiko Pulp 4G";
> +	compatible = "wiko,chuppito", "qcom,msm8916";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* eMMC */
> +		mmc1 = &sdhc_2; /* SD card */
> +		serial0 = &blsp_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pm8916_pwm 0 100000>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <255>;
> +		default-brightness-level = <255>;
> +		enable-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&button_backlight_default>;
> +		pinctrl-1 = <&button_backlight_off>;
> +		pinctrl-names = "default", "off";
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&keys_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Buttons";
> +
> +		button-volume-up {
> +			label = "Volume up";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +
> +	hall-sensor {

keys > hall-sensor

> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&hall_sensor_default>;
> +		pinctrl-names = "default";
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&usb_id_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&blsp_uart2 {
> +	status = "okay";
> +};
> +
> +&blsp_i2c2 {
> +	status = "okay";
> +
> +	magnetometer@c {
> +		compatible = "asahi-kasei,ak09911";
> +		reg = <0x0c>;
> +		vdd-supply = <&pm8916_l17>;
> +		vid-supply = <&pm8916_l6>;
> +		reset-gpios = <&tlmm 120 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&mag_reset_default>;
> +		pinctrl-1 = <&mag_reset_suspend>;
> +		pinctrl-names = "default", "suspend";
> +		mount-matrix = "1",  "0", "0",
> +			       "0", "1", "0",
> +			       "0",  "0", "1";
> +	};
> +
> +	proximity@48 {
> +		compatible = "sensortek,stk3310";
> +		reg = <0x48>;
> +		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-0 = <&proximity_int_default>;
> +		pinctrl-1 = <&proximity_int_suspend>;
> +		pinctrl-names = "default", "suspend";
> +	};
> +
> +	imu@68 {
> +		compatible = "invensense,mpu6880";
> +		reg = <0x68>;
> +		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&pm8916_l17>;
> +		vddio-supply = <&pm8916_l6>;
> +		pinctrl-0 = <&imu_int_default>;
> +		pinctrl-1 = <&imu_int_suspend>;
> +		pinctrl-names = "default", "suspend";
> +		mount-matrix = "0",  "-1", "0",
> +			       "-1", "0", "0",
> +			       "0",  "0", "-1";
> +	};
> +};
> +
> +&blsp_i2c5 {
> +	status = "okay";
> +
> +	rmi4@39 {

touchscreen@39

> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x39>;
> +		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply = <&pm8916_l17>;
> +		vio-supply = <&pm8916_l6>;
> +		pinctrl-0 = <&touchscreen_default>;
> +		pinctrl-1 = <&touchscreen_suspend>;
> +		pinctrl-names = "default", "suspend";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		syna,startup-delay-ms = <100>;
> +		syna,reset-delay-ms = <160>;
> +
> +		rmi4-f01@1 {
> +			reg = <0x1>;
> +			syna,nosleep-mode = <1>;
> +		};
> +
> +		rmi4-f11@11 {
> +			reg = <0x11>;
> +			syna,sensor-type = <1>;
> +		};
> +	};
> +};

[...]

> +
> +&wcnss {
> +	status = "okay";
> +};
> +
> +&wcnss_iris {
> +	compatible = "qcom,wcn3620";
> +};
> +
> +&wcnss_mem {
> +	status = "okay";
> +};
> +
> +&tlmm {

tlmm < wcnss_mem

> +	button_backlight_default: button-backlight-default-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +
> +&pm8916_codec {

These nodes are also out of place.

> +	qcom,hphl-jack-type-normally-open;
> +};
> +
> +&pm8916_mpps {
> +	pwm_out: mpp4-state {
> +		pins = "mpp4";
> +		function = "digital";
> +		power-source = <PM8916_MPP_VPH>;
> +		output-low;
> +		qcom,dtest = <1>;
> +	};
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
