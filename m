Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917107;
	b=kHaz0TD6/fG5Y8N5JU68mbENm0YMgFdgkOnJHlu7jnEnLeHnTG+vUUAlcQweKnnqNfpD
	 +SJgaSoi1nGzViHE6/ixyC66g/UI0iO/7kxQdcg8KB4IfDn27Jeffn/Dqi/7qHOrpTqtp
	 MUh7wPF4FYzcXtSYwR9n8dgszbHiSGiP2gURha0c++G9e22JUhjfmkRL9BkAOuyCYrznr
	 YYHd4mHdwLgt97wlUMBAugfiO2SzFinX5O6fyyxxseBbPvv9AO08ni9lXEtdt2SArjQUA
	 JY3oNF+JqzIy8eMO1l5zoQrhAXsx5KGSI9e3X9rtS2O/hONWEh9MnLBujEP3yccxN+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
	b=5IcD7chkqpv0UMH0yJklWXjppsA3vW3HDye6iAefj8NCJKiwqA48EUbztTl0U+ESr6Xl
	 LRPZ7ZRCm+tkuZXDmSx3FmvuNnX+KDBguU+cI8QrANNxfDO++pStgWO29CbFFux27luHq
	 CCPoYrvOSHluSyNEnZSc5IUiUxCcc8VgmMz9wlOmXeUSA2JShtjpibkbnLIL2e9gAoLdC
	 TBLR2gS6jM2v9+gfnjO4DT2CtH7wctm16/2jVjTiPlQPTNTgI1wG+JM7Ih3CD6wYoY5B7
	 Tvk8a9LARt31VhuoifnunKxLOpB/b+JAxoPCpqKbyieJqJjOjPCyhkc0YiX5onKekVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91A606A32A
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 12:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE91A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=ORxEYea6
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso295479266b.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 04:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917105; x=1795521905; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=ORxEYea6MFxGoUK0zCYHQMQ4RmiSZrwT7i9g46mYc6HzJwZYI6lz91n7MsJPSHP8L2
         VZgyKrSF81qlVHLJ87tuNd6qYCMfEm3kU+5hfW7eWUWEhoNOgJE3l6jJrMlMOPS5TnJg
         0p3rrr9O54Vmmq4wZXZ5jqs1z97LwcxxAAlZarRSVP1RgYMfRBjx/5PUjw4eRa8nH9qz
         56Bj2ghXjjD4cRETMZxMeK6F5BYd6JVmrmeDY8qcXqfRZqEosxGBHsCddrljWXR/OuM/
         tOWx2c7TEhSq9DR86A3bC3rjr1gVceVg4mDHCZoN5A1SWGE0B7Y0HcPOAkzSO/vs0NpX
         2VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917105; x=1795521905;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hw0ZL/BcMhgQSpsBsS2RQ/TIEgnIP66HggNOJxC2S1Q=;
        b=oeYLBOXmQXegNXOY9yFMZLyxXe7ZQfyz1UdUtulkHS69EP+4xsDI0yOX0ucfsovFQU
         652oiqsGbNvS3eXNzVQpLZDgA0zu8q+P7GS7GggKu8uPk0ZGj2ne8vdfqHjoWemKFxtG
         6pRxQiCxzlEtG0OB1beCc2lifhcaGV1vXW3Em7NSG1vkO0UEBPzajJif0HKzRCZs6BHW
         Q/ryvjWUMgTZ8np6QtgC+a7qVYMtYfsQzsGF94CYYXxAS5bAtdGeTLhp4TE6oDezVzrP
         tpYsS0ue8F1NjiwCHm1nAbCVig0oIQY+puat685gsLq+kP+nlIOTu3fMljesW4ZdH97W
         kXnA==
X-Forwarded-Encrypted: i=1; AL+hErF5VgGi1ynj1ppyD7m8cAq/2QNxZ62J4m7AclDX9O01RWMvXbH8QkV5geoD7IvAVGK+O8lKejw3rFo2ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qXEAOYAZ8NenQ/HPjKKnR9tOCNkC5LMoDpB0Dscz+nPuS1bHw
	xvJizw21TPLv5JCDkc+vA+oKtTBGjIICV/UDo8OYwgT1lTdlaE5h2LMLa9ARwThBsG0=
X-Gm-Gg: AYBFou1oxMGYwpE/gZty7fpatYJVGbudnnHqHnbNBuVeyvFLzgFr6hCOH+tmnBFALDX
	WSH6211QXkOAJuPB27QCGg7aTCSD6g6xJYPsGPeP1oGHaAyiaQM63l9uhz90Aml2z4oUObSIqT0
	CmuI0KmT8S/E9wZTqCGLxttq4vACTAEJRJ/fEt+k2sRnOix0XxaB8ikwOBWnIBCMAqNyY87KCOp
	MPM7s8T6rjgWDVLQZApBb2dNMvh2j0vrOV5csyehpOEkgOZIryX+XgjkAurAsnfZ0MAEBfLMyLw
	8F0WqxOrTTte6R+ZnwUYlCLFp82ucUIS2TGn1+S4HboODfZWyjmSdvVi4yoW6oxnBzs27+of9Wi
	tDLxhW5GAoi+nlcsL1i4S2+3iciP74q2RPbS2KZsUtw3QUe6G3rrugsnl0MRQNoZDhdgibpRDi6
	sdBheZyQIabfoQGAbLo6dL8tTu5I/3tJLXhT79vIjlbf1aoQRoYkQPWtIRS2Lhh+5v60d1I4esm
	OBThv45+v4qQnnh67fPT1mfeGmIh0X8HflqN6x83nCfKy6cIa2iTbwAcV7giLwsK3hZRVEyIGfS
	SnHH8Bz2e4p7vIBt058XlRWxMbWgYytr4GlyC7uQ0OHPXCjtRa60WgyZppwqvzyCHcVM4Cju72G
	KUSca4eChC3dYXYd5UzM=
X-Received: by 2002:a17:907:84b:b0:c35:3880:773b with SMTP id a640c23a62f3a-c50963f11f7mr1200537766b.45.1794917105150;
        Tue, 17 Nov 2026 04:05:05 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm473472666b.11.2026.11.17.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:05:04 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 13:05:03 +0100
Message-Id: <DMXH0E5U7WSG.W427836YQJIS@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 9d880f6baa531..697e1cfae72e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,10 @@
>   */
>  /dts-v1/;
> =20
> +/* PM7250B is configured to use SID2/3 */
> +#define PM7250B_SID 2
> +#define PM7250B_SID1 3
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> @@ -11,6 +15,7 @@
>  #include "sm6350.dtsi"
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> +#include "pm7250b.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -372,6 +377,49 @@ &pm6350_resin {
>  	status =3D "okay";
>  };
> =20
> +&pm7250b_adc {
> +	channel@4d {
> +		reg =3D <ADC5_AMUX_THM1_100K_PU>;
> +		label =3D "charger_skin_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +
> +	channel@4f {
> +		reg =3D <ADC5_AMUX_THM3_100K_PU>;
> +		label =3D "conn_therm";
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pm7250b_adc_tm {
> +	status =3D "okay";
> +
> +	charger-skin-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +
> +	conn-therm@1 {
> +		reg =3D <1>;
> +		io-channels =3D <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us =3D <200>;
> +	};
> +};
> +
> +&pm7250b_vbus {
> +	regulator-min-microamp =3D <500000>;
> +	regulator-max-microamp =3D <1000000>;
> +
> +	status =3D "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


