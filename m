Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574803;
	b=eEhH5vT9SbdpL+5O7uPi8VcskqPebbsSnDqXCtbi+veVQ7yekpqaZ5RAPx+NjLAL5/Tz
	 RnHDNwXMn3K5SylPZzk86RWB0w5mW2C73I5/FFWfRrmTzCTQ3VnRbpm/o6GEWPxhCtpIM
	 NoY2byVPklt78g2LoS8uz7IrxwgUB8TtMW6zdcb7zCekndQibYbu3cBU0eTCdyVoUmmN/
	 xHr306qyhfokA8dOIcMyXY01h4653zR553bKBzSO1W4E4rcN3dZbv++gUGZQqK6jNMlyx
	 kenHFv17ZWnh/oRuGZtbpK4gbE9g0IRe0nelzlFBfzp1q4ICy4Mqv75Q9Vuno0q2dSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
	b=flH0QF3QR33pBlmte73vdW0vDwXOh26nxjjJfNdRbP2P6qZIeD3sa7yiVw53GxPBl74R
	 Y7i/ff7r22agzsLWZa40uc//+Igbdb6DcW0yk8kQkT3VCX01hhDhlZyzWd1nNK+m+aW4S
	 0bASGrNqfa3gnip2UVzaP+Bhv/8kJjzTK7FlEaLlIFGspAQUnB9TTGjZMF6JQHw/wAqIj
	 ZR3KaPDrKo9yeMnn5Ab41F8QZrNvC8ZvSURRF9mq4trTtPNoEjzgsmTtaxAaQDUF3oIn/
	 fEeVPfdEiXvhD9nX9/jK8VIpcxAx/MOkL0djh9mXsD4X/p/0ToHbxU1lZPIv2KhywDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E3B606A337
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E3B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so166602566b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794574800; x=1795179600; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=UvD9jOHk4SiGf8rkczNn6Eu5dUIyL68LeD8TP0a/E8TFSluP09i1lj2STN+pBd1GXn
         r0uw9Gl8kUyeEgYwk17G4cuf38u7C24RUDfNbWEB3MzjNyM/6nbDz9Hgmi2xs/rV9rrG
         nob/zKmUNGCENceo5OPAplZ/3ct4N147esrwLqNg6j9sc4tDO2bDrXTeu0NHcpwmGHr4
         RyPPSLA5iduIrS4kXN6Szy/UMAP8J6zqbvLrKjW3T6gG40ajhCHcQtfkhLBriUwm2UPA
         pTzPn4HtoaIgXkKNwiZf2qCLzhOe42cXmBhbgp56MJgl7crXxsm4WaNRgdtQ65JxISFV
         A+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574800; x=1795179600;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=T7iQcgr8OSitOpxVWUEKxrIYNOtZ+n/LEL8KREucmtJbQkzaI/l0Pc9OWLKraP8L/W
         KNE+by6KwlmSr/2CpRS38qs4MmnJxg9DkPdmvXAIAnE+YsexuQL7lQ+stxdH8QVw/0HR
         fy++g/KPwOEv5m2SBwSaTiBmjWVANXJtCRpd7IqU0as7wurU//Rb8MSG/Xr6GPRyrU6k
         v152OPjKRlIhhpci2vv/uZK1E+VGHpvZDoZBoLTupvuLtxoD+84bOWVQYlYAhMhBk+32
         CFtEo3+HdYKDioc61gbk8xFZ2Lo3I+ILDTIQP5Uenit6p7mYZZGXFBKB/RL9g7pD7XEh
         8xVQ==
X-Forwarded-Encrypted: i=1; AL+hErF8yjgNIBYQxJP3ARYcIspD8FSpSq9fRgUYUuMOmNftn+wa8N7hKZArPSENSLXtmUOgl17VKtUEHJzSyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y/cHjDEV7N6bugNvrFkDXTf4e8Ai0AyEgiTXP96AZbpYnSHej
	lwPnxaUnDX/UnikwHDepn+CKV5VjQnKiirUjBGgsFQL7Ve8QuM1fsU3p6KdpcsuEfHQ=
X-Gm-Gg: AYBFou2c+R2baXCu8Jny8fF/bOc2ylrpAWJALjziS0WdTCMA+nl0k+F4PfNVWWOIaXX
	eD2eyTuGTI6TQ6UL3wSTKMCe8Y5rAIG5hRvkJa6Vw5pXOGcyTzSkmx4BCAZZkxfiMyczorTekbh
	OAsjWOEI6gup5Xs84vpmufrlDzYKzZiPSIFzcPRpioNZGYKKDjIORhl9XM316VfgipQLYC+qYa9
	Lkw615WWcw6AYOqwxtLeoU/FmwQh8RpQquKuW5fhPjQwvPJm0JsGM51WF+rs6aFis8Q1hVnVaul
	DyOjfkpP4GMftWIBrf8ooONNNvUdLcvygbEFjl9Dw1leDkje/hyC1EMJgrfadSLmabtOnICgNe0
	oQXFGdKk1ZAQmITbmcy1OccCKIEKT9vkCPqpEf1SRjxfKwOpSMJb117BFjcPQQii322JYtSJ3G7
	st9LaX8WSNTYE8GXWaSJYL+R5E6TixaN4W+FersLJ+S7RllBlz3XFDwGZ/OPGTQbn7Ux+4fgz6s
	+U0KRC5XXrlLw+BT6uFuhCOytbReO14590KZB/ZU2cjKs73XJBsTwvhcuOshw+XkIalvd4CiYPE
	+bjieRT0MgwNICZoOw5KqYXK9liqc/SS/ZlJMjEeORW4VVJ8ZX3F/0dWTqRAJfvT/rdXeDb84A=
	=
X-Received: by 2002:a17:907:9624:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c509614d513mr218483366b.6.1794574800110;
        Fri, 13 Nov 2026 05:00:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b6f6eesm88283366b.63.2026.11.13.04.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:59:59 -0800 (PST)
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
Date: Fri, 13 Nov 2026 13:59:58 +0100
Message-Id: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Val Packett"
 <val@packett.cool>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>

On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
> Since Linux has gained LCDB support now, wire up the LCDB regulators so
> we can turn them off and on as desired.

Actually after some more testing with extra patches, it seems that on
FP4 the touchscreen stays dead after toggling the lcdb regulator, while
on FP3 it works perfectly fine.

So please ignore this specific patch for now, I will figure out what the
problem is and re-submit. All the other patches in the series are still
good to go in!

Regards
Luca

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---=
------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 37aa272019cc..d592bede6a61 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -72,14 +72,6 @@ key-volume-up {
>  		};
>  	};
> =20
> -	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
> -	lcdb_dummy: regulator-lcdb-dummy {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "lcdb_dummy";
> -		regulator-min-microvolt =3D <5500000>;
> -		regulator-max-microvolt =3D <5500000>;
> -	};
> -
>  	reserved-memory {
>  		/*
>  		 * The rmtfs memory region in downstream is 'dynamically allocated'
> @@ -784,8 +776,8 @@ panel@0 {
>  		reset-gpios =3D <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
> =20
>  		vdd1-supply =3D <&vreg_l1e>;
> -		vsn-supply =3D <&lcdb_dummy>;
> -		vsp-supply =3D <&lcdb_dummy>;
> +		vsn-supply =3D <&pm6150l_lcdb_ncp>;
> +		vsp-supply =3D <&pm6150l_lcdb_ldo>;
> =20
>  		port {
>  			panel_in: endpoint {
> @@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
>  	};
>  };
> =20
> +&pm6150l_lcdb {
> +	status =3D "okay";
> +};
> +
> +&pm6150l_lcdb_ldo {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
> +&pm6150l_lcdb_ncp {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
>  &pm6150l_wled {
>  	qcom,switching-freq =3D <800>;
>  	qcom,current-limit-microamp =3D <20000>;


