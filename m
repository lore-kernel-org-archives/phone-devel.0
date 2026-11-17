Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916940;
	b=0MXDacVCbtthhA44zDhDLHUMKGxmphg7cmy2pgPFteUSXiypyQPIJ6Vg54/LLe+4UlNF
	 IPuAf0xQpN2X9yDD4GLV6HvmuK12KGaBxNAhBJ87URMlevGk+khNLG2PWdO9LIBrzDZMO
	 mfqM+hg9SZMmAfGT2HbJURpX8lilf0B/R/9tmVgI39E1r6ITZYe01gQmYOEVj4ACHiREq
	 INeeuKgfhqwauyg5V9SvBEznTgT9ywNo5vFCSIZtqk4d+//gq5EiB4arvhJO8doNjs3Ik
	 3addMtMO9lNVsHSDp/t8ICCYOUOwFRej7ySteA0WKRXk1zNMZgezHfY1ptBtqccFerQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
	b=jFzllonRMyYErGqP7G/MC/BeyrgK4tRSMprLMZ5qd8Ox2eUsuEJ9q53iumP9TFO2yfCv
	 698mCH/02v9Uu8u52n/dwAr4ir8OkUqM7X3wrag9+1B6ELxeitu+3RcmyMmOgMf9J/ULp
	 Mmet+EkFsG/w9kwWOi7l7KPAiXdCuMd2G0if+ocBwhOnidjFuxSR8q/8hBnsKJyaGthCK
	 gaKqCANh48BNkXld82OvqmawBCGJsJ4zW327Zg/BVrRyI7PmRydtmfXobmuBIGsx9EkRv
	 NoCLoGqe1jeUs+7Ic3/3/Suv94HChDaaRrrDZ2BRffnW6TfGKgcYSSR/QE3BzjKNRkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03B4606A323
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03B4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Th827p32
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so7533463a12.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 04:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794916938; x=1795521738; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=Th827p32i0l9D3dCfJvt6t8pdkgOWmCvul17AhFFjNuJukCtmYruARt4sMdL3QUntk
         /xQ0yKa8WdJnizBI8kqOWfBgMNq6peVRv+Xyu1951YpaUa3jZkxEew2xfVNuL/MfPQq6
         kRRmIVNCcxJzMVkB1BkWWZNvwVkCe6IJ8PsgAm2g54nH9NV60iMV4OcOzq9MZAwtncHP
         d0vXcrnAVqWEOqsmcrHftcwvPrz6P64ycSu9vSt1IWtiKjIMRDEcaHlSk9zfNQ4Rdyo5
         uRHppU4E6d3q2a2sG4Ggn+5uc/Ex9NqQld4G8hPB2xtYg+21jWoFWz3bMq/gLBal5A7I
         ZhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916938; x=1795521738;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqFEWe0x1tzwyClz1tTRFPazaqExHTu4JKiosZvtC2E=;
        b=Xr7PkmYL7a16qfAFzCK/DWTc3G3uVka9w/jgUPcmC+1D5xy/qhpTwhKW4eB1QaTrSe
         NA3id5GGFtJnuzh1mdGJJrF+l4BRZcuDWG22TxzKg5Gi+AWTAeg5jlGtKeS16sT6wyTk
         yt2zI+2vAWWBzmaWgo89xjxvZwU4fBXxYZvztYHQWs2SjNLP6VtY1PQj7e3ZSjv3dZ7Z
         p5OhCOVQ2X/E5cuNnqQkRI9aXvIodZmbWREhhdMpuHZr4+FfpuYqJcx7gLSPC2Aye+qk
         HpWJ8nBBxqVN1k1INXa4MzaUKxk8fJ1s/rbR0/RyW1vgk/SGS55vcCgrOsYr+L4lyXHW
         4v+Q==
X-Forwarded-Encrypted: i=1; AL+hErHb1W0XsNq4tg24qoVa1/db0EpHnyat6lULdMZ4neJ4etT5li4TNvf3WS8TpbSTVKJLzTPSHkr/tq8nHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+65yzYFKzCpOwAdSLsIRuTkzDimT2nI+lgVCbdtURQTRoipjP6
	rIii6DQMWu+wlM9EvobMhv0y+aeJ+QAEdm1sd2d8gL7XmGFRmabwz6MtXeezxEs2070=
X-Gm-Gg: AYBFou2qatsdFuTOFU8t9dYS0L+to3FNEeq4TCubztQGFf/haw6F2RuQqQYMidvtdeI
	qIzDqlftazqw4rGtw/zxau3IRhXHoSmW7b79XX4zz9s4LMiL3dgIQG69NOa9NhX0QFwrnGyZ8M3
	EM0xWoBk6kFqNcrYBs2c+6F1F7KJRDH4ljoXXpzFyiqqccFDYE5dmOaylVMvtP7VzMobH17uHdO
	dSLC4q18NdzmegUr6ZYrp5+yjafDaA+mfLuAmwIUuKa/gjpD1G92Lv3LYOmttBpYvLNCoiiG8kI
	GGHKnCVcfns5X51L81Mj+Snxm2NDNnvykTo1mwoETL9+H3XOaFho8IYwjqtQD3sSu6YlOTaqboc
	sCrUc/K4bb0kieSmunfplwG+e1WKLavU79GSdtMGncF2W9qg5arSRACSA0GZdG+Zw8edjR4KMY3
	QC5VN0ZmlPMDqtlMP07rAqS0zUIc5JZLsIxzo85Th//ACUgH6AOvA1xi0yjOg54FqGv4WGLmAxq
	viPBM6uDVqo0tjrpcfP8KuNp7pTKC0bMePalND8Q3cxthUTlYgzUXKgEqYZS659HOwBMXR372/6
	8HnlL29J8F/XljB4JgNDKfA4q3yl62VmLXIxqN9W6n3iE7rS4YEEeHg0QyizNH4/rl9HUxGyIA=
	=
X-Received: by 2002:a17:907:c06:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c509674081amr1060134066b.49.1794916937935;
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50efdb3471sm115816066b.87.2026.11.17.04.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:02:17 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:02:16 +0100
Message-Id: <DMXGY98BB06A.KWBSBPSFMXJ9@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
>
> The phone has two PMICs which have a PON block, disable the PMK8350
>  PON and keep the PM6350 PON, as only one should be enabled.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 697e1cfae72e0..50a235d6fb6df 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -8,7 +8,11 @@
>  #define PM7250B_SID 2
>  #define PM7250B_SID1 3
> =20
> +/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0=
 */
> +#define PMK8350_SID 6
> +
>  #include <dt-bindings/firmware/qcom,scm.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -16,6 +20,7 @@
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
>  #include "pm7250b.dtsi"
> +#include "pmk8350.dtsi"
> =20
>  / {
>  	model =3D "Sony Xperia 10 III";
> @@ -420,6 +425,35 @@ &pm7250b_vbus {
>  	status =3D "okay";
>  };
> =20
> +&pmk8350_adc_tm {
> +	status =3D "okay";
> +
> +	xo-therm@0 {
> +		reg =3D <0>;
> +		io-channels =3D <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,hw-settle-time-us =3D <200>;
> +		qcom,ratiometric;
> +	};
> +};
> +
> +&pmk8350_pon {
> +	status =3D "disabled";
> +};
> +
> +&pmk8350_rtc {
> +	status =3D "okay";
> +};
> +
> +&pmk8350_vadc {
> +	channel@644 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		label =3D "xo_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };


