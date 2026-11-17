Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917222;
	b=E4Ugr0yffIt7BGK7gCOPBH7OMMrVC1ZfG+ga0NwcYNx746ZR+31AAT24X7rCeEltwwC6
	 UbhydgzSb0z3ZWRLEZSsG8PGbUUWwf5Mki1Xtr09vad1hVcbLunSE9LjeIh8NwoMIgRCV
	 2cP8GcatHDXOM4cwrvYPSnIexO4BJGey1e9WJHcZMFVFxiyRWDPn5zY7WOeq3zBJBgz+e
	 BCnNkC1p4Ys9Hukn65ZMLq5es8ab6hkrjnJqAsk00rtFmHVIEhl58epaxGwzIHQr9gYAy
	 y5QW3EaN+w7B33m2SNlyg+CsFaIlrxyK6dPPPG1gM9td51O/69+qBTuz2oC5zI+lvcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
	b=c2CrLslT/ry65XpC9J9cFUJX3JNORVxc6nh5GluXS/r9iVuWRP8P0XvopewgtXxbBW/w
	 UpfK4sB9mB1+DyYbffPQJaeyxnNNhSDdc3K+qWVLnDH5lfE7MJ0Y0vQMsmpaCnd5udmg3
	 E79MrwCNDe3u1d9DeMWier6KrkjK2R3X8xjYjUYW+y+bYd0kwdoKMs0OHcexkwht6rjc2
	 l2Xv0TwDs/HLhDJKlQAmS08BIqU5Lx6Wr2Q2trvsN4Z+CEK7lnjXjWLVf3WdaDuEzTJQU
	 0Nu0mql8yRZQ+bXf7AXoCV30JetsPcJNYoK+3jXaHgWecO9IH1BbYCSsAAbf5gHsMpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="0SXH/KI1";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED99606A32F
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED99606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=0SXH/KI1
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d30639709so628354466b.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917220; x=1795522020; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=0SXH/KI1Y3sFR/g1FdVD4aywE7M953r8hni0T/LCpli6q19nDR7TUQ75KMweJVehSF
         yYRb5xKjPO/vtngq8ekpj5yShHNAARPN/0knvtzfPG9NWvsGU/Ahi9kyXDncp1CxND1Y
         StsB9I/AvGZOe2+fcbvcC1F+NgWpJh1hJmTOc06lJWbwVwU4YZ9Egeygy6XF3qqtrpGV
         oSO66+YyHJkUTXaLwZCmT+VOfuFUHtnr4Lwq9U2KMY+L7s6djeKeBl5w1DLV0H1j1sw6
         5YuP0JUF/7bntcWL6f9C5SQPyxsXJ7bG0wPEdSROPVT2945ojgBEVS27n8Lsx62x9mpR
         VizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917220; x=1795522020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=WgP1rEeiYqoQ51pMnLhLuZeUz0p3+WlyeOU0yXdxU9qUxW8AfpzjCUrMVX19jjKxOd
         53bhn9uBJgZMBslfLa0kH9EWBK+XNC5cwZ5dEUeuP9g6wIgChRcT+F+UBp79l3wXtp6w
         LbOCWl7Na+27VTzzb6Dt6f6d+YaK+F2oOThyaNMvrK+LRs8sirEXZ+hEYbi8zGf9VzN4
         zxEJJXofPHcyzxIvKyjZjtXXtD2WWVs+84sh1AvcjJbactrkfqivB7S39iRT+FhbpXiJ
         zqI5UBiVLUPAfKSBjbPfNGk/DkMZ5YUaZTQFHBv+kM7om4ODEVs74LK3i6b9CPUwG2xW
         CzDA==
X-Forwarded-Encrypted: i=1; AL+hErF97BpC5Ee+ArFAa3J2kUgTB+ebeMhB5JZABFbm9Fr6J+cwJNggGvmm9EWJzbJj6GF+A9Qg/UtByZastQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8A80HDbNcZ0fYk8iVtniE7EjmH2qXtijcXNH14qc4c41OLtWDA
	bH7p/MfoD4C7l28TbKU20i02F+aWeV7jrWAZQ+gk1vC3CndeTyIyx5zDrDxhvNRtY08=
X-Gm-Gg: AYBFou321/33Cup3CT5xDvZ5TTdh7Xjh3o67cCeO55ind7VqfkP7/phys9pr/V2KGfx
	jtsimqcvtIeg6bb1TbDyuaXWnpvEFfnIWIDs8+zkWYCk0QyWh3u8RKycXS7IuFhd2kz1S+rv6VM
	GJNuu7TX/HzEG9Uw6xu+l1dleQ34J+lIwfGbGGrpJCCE6PiixpBDah++aMyi74bg7utXzIPpUJg
	rEtz8bns2HYaqBEXrLissKaNkz1jVIcNCMSF14RC1XXRgKkX37xdJ2EagpF6W0RBncfmIJxaLcx
	4l6+9+n4ixGM1Gzzs6IF6HKQFte7C2Nw8vXayF8+pPL+Sosm4RBFr7x/Q2PvLNC6pyPzaVMFpk7
	rBi9sDAm/ndolX8qk4snd1iZ5Vgc+zJl3a432rD8qIc23Og/+eHUsj2AaRRMDkHgs8CNEAabdFb
	iJFQSr7j72zVYxXkOQ2heXG3bXxDuQJFUxQJE/QZTY2OhigvgqRHaBshN3SrlR+K8HpBMKlPqVc
	T5NKuFxhYJxjFm70eIsIJjjc2hmkS/I6vPOdraFwGEdRY+3BI5wcCFM5HGM9xoEraL7fCDHshyz
	QKbrgqa4hQulHKwN3IEOD1ALWZ0P37UcwepMcknKiGkpXwC7SE1h5vz3Gt9AQ180TWVvN8wnTA=
	=
X-Received: by 2002:a17:907:6d02:b0:c4d:4d5b:4bd6 with SMTP id a640c23a62f3a-c509654df6emr1125503166b.41.1794917220010;
        Tue, 17 Nov 2026 04:07:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b51bcbsm522082066b.44.2026.11.17.04.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:06:59 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:06:58 +0100
Message-Id: <DMXH1UYFI74N.FT441QG9ND7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
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
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the chg-skin-thermal and conn-therm thermistor=
s connected to

This line is a bit long. If you re-send, please wrap it.

> PM7250B.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Could also be squashed into "Enable PM7250B" but also fine as a separate
patch imo.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 50a235d6fb6df..0bb714eed13f4 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -80,6 +80,32 @@ memory@fe901000 {
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		chg-skin-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		conn-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &adsp {


