Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917284;
	b=cKPAsPqFYSAdbO7+W9099YASM/ocwBZ96jZV+MwK3psReTMVPG9yCm8ZzhRguY7yg/cW
	 2ERwxeupLdAPQ9IJYPYWUuHF50tOqpgcsEU8w3YsN7eI3q1j7FShQAnXqrVeCUe9kZXsX
	 Nja0hrFVBqOMpoPmiIl4a7Bau7if6s5x/xo5GYADW9Z7VfstYv8ut7MB+r/BcK/gHeOqh
	 ut46s+xF71g3xptaAjJINNmZQfekUpqGKc2JhuKYq8/VbWA+DqFNzBR1ru++4AB8QOMF2
	 XA3h0wucmd/FcVwPISCXYgL4iP7S2t86u4L2b3xB+lPMnSlh8kPgqQYg30UEegWfKtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
	b=HnU5t+zXVZUq6IKvXqzrrryazQx5bZ9JvEYmO2KH0Nxn98ux7sAJmChggfw/BMngYvP8
	 SKJe06ZWNFQ/zYYwAUSTCRjekzokpKKeL1BZYl/eIzZVZ03ExBG4NkjzIQ5nj6L7Urthp
	 ZvC3ZyVu4dv1F4nybIhmzZIfrgQpGquBPCgvgecSgnhJeRbuW9IP/T+csbyF9wtkOIHCU
	 lv6GculkC5qB7eqz78WCz5pNjwTcE9HUdo46UNsktN7OJiU9/J73Sk3G9xx+fHWMLvVR3
	 XPq95wov+l1nuTiyRlaWYyCJuy/fXFyPks+sYd9FzoLNGQZxsaG7QF9DzECAMlYq36w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96A606A32F
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 12:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC96A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cdc606b47so792861866b.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917282; x=1795522082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=dt0iCOV8v9GvAZFTt50yVBbkG2wg4ZbVorZMsiO2KekaDCip1lwFjGMCgnT+pTmn1s
         PyD96HT/urX1171AawiamygQPsZM0QOxGRVjmbzF2ZVvR26mtxc4OFKszLYGJMhPUlBF
         fLbReExtNhC7bOHj3TDuqeIN/ptRUbNXFQG6hqNZiaaiYL0CVQ8/YYUxaWnje3peW4do
         8BD3nCUiO748ANhh9WzZFJi9cmyAbWbmeVxJzA5swoFc5cxLnTSZ8oaMsJsoMcMivURr
         klv6TPVEXsjCMpxns4NpXPrBxieCaZrTg9xJjRaybRUunhjrdWpTjo3OcPmHfRtt/i4O
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917282; x=1795522082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=Hd2yP0l0tVg0QLRg0hK7gyF2iAbq7rGGYdkjLNk7jwBNBT505mMqlfCoDyVreUXWyd
         CKZsHLbHHJca3FPvGhSCnJRdkp6dmMaichqjJyw+ZqrA1OWTsPrZIA/XHa3n01SOEgdh
         VyEyIS2SEEs7Kl/47ovSSEfF5V7pm51a+ka8ASYh88RhdAae9RT4IO2/iL5myDD5lxHX
         5xazLgWmi8/a9+nN4/aYgKCnTlQHxH5Fjahr10GrSj5L6vqf8vrbWyGzV+dfSg5IRUOf
         ZV+ovLy+07giDBVQ/oUwLG8tdYY78wHD8uU+hReFGRkui5t43hYDzPZ0SYztrc2NLT8i
         /eow==
X-Forwarded-Encrypted: i=1; AL+hErHwWsHba3OMe09+xT9T7qj0ZjUFpKLXi12lHivGioK2KHDxzQBZMCe7WKaRz9jgFnuayYqXi8rOG93tGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9NKzF5mbDQl7JpYm8v4xXCXYwLALrlNUMP2BUKEs8qqt2D7h07
	Ow9yI984BPNB1KjsQR/00cgxtUAxZ7lBpKYVFKjntbs91gtZ2hJeMGOYkPqFgjo/uCc=
X-Gm-Gg: AYBFou35vYJkIfgCN0v6GSER3zjKE7c+d4vDvrIJYa4Awkm3anrvocaGg8Uqa5OwJ1X
	mdoHTCQCvBBdchL+FZIDFNtZx6G8xcZkwdJauQKI2gD09HutrXYVBXUWAFvoNT3/s+SkxPCdTZB
	xHNFDHgPJMEIrPfzmRnxAPNON/kudh/CO/9IaM6BwGsly7IaX8K9bbPyxRWleLX5csQ7rpOFHZ/
	VE1/RosCIC60vUrYVvBmWmrgmgfoYAnU5JrRsRzytrnafMdfHlsv3F7+X16xTOivHe/Hi2YvDxo
	BZ2oPzbS8DuJ/9KjXuwerM1x8BmoGMhybPyuNIAu+xbbLe4fqmIB6h03seOFbAHlrclnV4/yovt
	HLRQUG2+hoHZtZZG133lk1NAxv24kfAk55VUox4X6k4GsnWxNIq2D926eMenBK9EMl9q5wdhHUs
	jn6AM+yEnp+tXK04+D23aET6DKo75AmQwOzCZdqIX/TZ7kliPeGzRqIo4M6EdyAu6dJKg3Qmvjr
	dPvBFPbtlcR0mJWaaxowjYLKvLwJz3kF3sLnmEkSRjXv1LEfxgT1bvSOMtOfgehQKKCX3yIgUIX
	tIe5y03RJuS8nxXob76lqOoi9dd1RLfvE4vXrNeGwMnEOBsQW2tJ6rJmV9MTEtoNSekJNKbLOw=
	=
X-Received: by 2002:a17:906:1f4a:b0:c50:aa10:d898 with SMTP id a640c23a62f3a-c50aa10db4bmr727613766b.26.1794917282269;
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8650fsm525227166b.77.2026.11.17.04.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:08:01 +0100
Message-Id: <DMXH2NN4W05P.20N2ROUFAX0WZ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
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
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the xo-thermal thermistor connected to
> PMK8350.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Same as pm7250b thermal patch, could be squashed into "Enable PMK8350"

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 +++++++=
+++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 0bb714eed13f4..b86fe11fd5296 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -105,6 +105,18 @@ active-config0 {
>  				};
>  			};
>  		};
> +
> +		xo-thermal {
> +			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
>  	};
>  };
> =20


