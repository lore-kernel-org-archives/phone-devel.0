Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915083;
	b=vp7f/I68SAvEk8rx+RvEvcFiut1aUZCL2h2v5c/JfGI0ljffQNNsGRuB6fG/jOk34S9k
	 XurgmcqmlVx17tiNwjsnbO+0Ct1L0NY+7mbuCCxJ8NljYSfDnk5/HtcBP2QP3iPLpcE0a
	 Rj90UJGMrDyoDjxUjnCAjgagFqn6wwToitO2n7RFO0+Jq05yy+z6uT5epDmQrUQBwD2/y
	 3/FPQ3Y20lrOYLZu/nyB+Uo1qEZbxWpKKZKHVOSQ4ZqoR5VSxrDr17c8qoXaU1SwG+qmy
	 FRTk56tHgiVZ/9YWQUr+A+hrGOyRe8H86eS19x+uH65I6JFsfEqqfFn1GJkoye1R29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
	b=vqthGd/6nfDdZqHOJKxaSMxssj/1WcOxIHno5PlhtzRADr0M390YPaP9sR5B8bX4UANn
	 uy4v2PYVOSHlrJumPVFwVSTtjdN7BhAesres+dfQybfGC6wBGg/J+GNvcawBMu6JdajGe
	 fbRHgqtLI0zoZ60lW7Qr7YWjPWIZI7BEkEB17X+moujoQAY3RrtzQH6Z2CmZ6yWfenN15
	 IQred3B6i0U85FrGSUbUdCcb+FKKXRe372kVSjMbbQfNRZLirnU5V6079h3JmDJYCRwwC
	 WSDOGxcBO3pj5XWpAWOzF8rbdRwcNkoCGM/D7vz7CiO+zbfZvq1CtmiwcLDTnpaciTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAFD606A329
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 11:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EAFD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m8IY2Woy
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so6316448a12.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794915081; x=1795519881; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=m8IY2WoyLPfitWWglS6wqI0ATW3+TpbTj9ibHg8nvn1/DrViKj9QNxHqEYqIRERZ6F
         Na+e3jdV/rVSS7ALdanwyCzuGzZMhejKsuMydwP3XJOnpEbcc+xXa3/9+apBe6B1fg5h
         2iQKAF0w4njd1P7NsCgck4NNFKfkXExe6AZDyOVw1TUYD2WyHFbAPW3+D4/kMjokiOT7
         dxU3ryPxLIHk4mx7uofmiAXMiGS+qWMD29OWpTpQ5WOWCCX8Op/qJbTPkfTkC1kkgTmX
         RfVSoXsgINXsUIVSdH0RXqA6RxIHK/tWBUitp0NFP+nnnn1+OPuPqeuomXE8YN2MV1/R
         GFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915081; x=1795519881;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37F/rQXOY5cbeWkahN1eco01zCL7u1ct5LuaDA+efic=;
        b=s0Rkffdzcy13PmwQmbxlPCu7EmhHaT4pF8XQydGXP634KI0umEnasRxfoBtgOnvJMb
         GILuQ6a8gCh7Y7DP0mQhxn6Tj2gf6tjfp6pVcAKAqxMLPvyA1oAuBZWxMy2XAZnjsRSr
         g+OGEMctPPHBYvJXEeVX4EalLVN5ezvXS7u1P7Usd+c9BHyb0oo3EnEQTGs4SZuR4j1h
         SdEWU+on5j13zTU7Ptr1/7j+c/hby5pD5yDl5jGH1BVMtKJS8UBoZeJ7bmdWTm6DZde6
         bdeXucVe6QS0aNlXDaVqSrWodtADpfB2zMQKCmoirVInxhi+hj4OX41qlM2OfQxOkqxF
         uRYA==
X-Forwarded-Encrypted: i=1; AL+hErGzOtQ+vqXLKTqAoqB0bf4TT6efBFihhfcQdIdCylaJhhjaiW8pC+aOU9FQ3KFetAAlC51WMtHsxUaJvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1G0EnfYRsGnlV/ggEydnuNmF5jym8TlWoUKf0TrXg9VTYs4n8
	ziOxvBm5uIbIB8zv9Sl1H0mvRmMNN579dYvU3C799b1+Dkw+QtzZUn4+8n/5LgrVobI=
X-Gm-Gg: AYBFou2a8imYYdDcQ2Z7jlNFf+yMVI1jCidqXsFoQMk6m1gNFSjtKwrTNG2CyrkDPUC
	ZNClkdH/2cARPh9ehnklPKzdnWjKoQTakWkIS23AsmCmPHwt/VS/aLt1X4PvWsW8B/0u0iNXDj3
	eaUofMSn20e5Vl0OTz9G7VAI1zaV+y3RhJuRfPhRfJ36gvlh6O7OyHPYeZioj0c0yr2TSJ/Nag5
	KB3PNMS/W3qvq+dChzQat/Z3NLA6vq9ffobOFlWLNWRbdYcyXsC+3gVBAIWImhI6xqAD88mqsyc
	4VzZ/EAEOVOKltPtAJa08t7DC1OwmHqLIx2rai/Xtqpnhs5HAxMbw4VRI+vZLhjSeUrhRik3x4Y
	8eZnxr4mby6jd5fRF/o8FhvHVLadl5awCoZhn5bBjDlTvNB4RVpC+u54RBHECEPyj3rx+9wkVDA
	DD4i2xBxv06H5BpaCRAGEZyioYU6QylRFENRA8hpGJpS6kZOZTqGS+s717zp0w3j8l+1n80ZKNg
	vycDUz8+bd+ZDhXcZQb2/ma2mJBzkfYud4u5+oE40/s8hWo9q4m0hxpZahbxkbEVyyxTbkC2wPY
	ak5ZaLOPt9KrYaSGa2N/ZuOqCahq4yxnlWc+ueRrs/lv/O25gKeQO/lJ3i3xsV0HNKofLs6PNg=
	=
X-Received: by 2002:a17:906:dc89:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c509642fa78mr1153445566b.38.1794915081033;
        Tue, 17 Nov 2026 03:31:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79146sm519632666b.68.2026.11.17.03.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:31:20 -0800 (PST)
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
Date: Tue, 17 Nov 2026 12:31:19 +0100
Message-Id: <DMXGAKCZ1Y9L.3IO6O895BMH6@fairphone.com>
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
Subject: Re: [PATCH v5 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-4-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index a393b7533ccbf..e8808865bf6fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -68,6 +68,12 @@ memory@fe901000 {
>  	};
>  };
> =20
> +&adsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/adsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &apps_rsc {
>  	regulators-0 {
>  		compatible =3D "qcom,pm6350-rpmh-regulators";
> @@ -291,6 +297,12 @@ pm6150l_bob: bob {
>  	};
>  };
> =20
> +&cdsp {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &gpi_dma0 {
>  	status =3D "okay";
>  };
> @@ -316,6 +328,18 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&mpss {
> +	firmware-name =3D "qcom/sm6350/Sony/lena/modem.mbn";
> +
> +	status =3D "okay";
> +};
> +
>  &pm6150l_flash {
>  	status =3D "okay";
> =20


