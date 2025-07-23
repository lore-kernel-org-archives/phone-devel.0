Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C42DEA89
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280466; cv=none; b=VkhLqlXmUvgsim2RlwFWHnEKvrzpVZ/RrJAyorLPiqPNLZLWjc5SV8pdA2zZ0bqikH02CxK/zW3JNjnZziJyUV0kyVfmHB5YirU3Yc02rDc+PAAyvlcl7gi9+SjMJzMmsqTYqk4VP6G33TNuRZCX/09iRDmMYzkSIEepmfU4YLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280466; c=relaxed/simple;
	bh=uxR8hSIGVZMlUqZvWAGaCEqh6juFlUpBiECC7T1VfZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dGi2FB1okqzz7KHPDF3IFoqAJ0wInRwnqDRYalFfiRe6gbHKjkx8yVSfp2VwaAOL0A4i+q5KStk0/xZzVulWca/A+6Qdz8imqGuoY6ZyLrOQ9L1VGVo4NuUXkOWUrVY9iF2hG2JC+acLDgoac7yiyTetu8C420RQi4FEom0pcM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bpVBvXyA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bpVBvXyA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso12570193a12.2
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753280462; x=1753885262; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS0lxrQf1ZOnWA8XFa3rp3xfTwC/QvmIwsGzD/b2reI=;
        b=bpVBvXyAJ/FUbp2XY4I5zybksfCxBrlnLrdhUiBqXd+oM1A0Iq1tS0fi5XSHFvkAMI
         0xnwgW5lbnFkeBOIJnL2eqA6+Aofd9h8H+pjARPRlHzetj8isHUtS1Wtq9bkMhqjhYgd
         Y6zxtCAMoOA90L4klMZjeFieYcUP6UfbNalMAtgvGCrDfsHTEVD3F/ltWCl26wNsvWYz
         7T5+m/KDeO/dPUskWb0IRWgY4MDw2+wyRHXOX+bjvZ54NcOtY/fccjTl9N+/V/xQsajM
         1YgwoDEUzJN0FoIohq7xFmCBqlZYYqF0edX84yaC4qod8NWOxHVJ6LMuw9D8LXulYuPg
         M4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280462; x=1753885262;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jS0lxrQf1ZOnWA8XFa3rp3xfTwC/QvmIwsGzD/b2reI=;
        b=b0OyNSdbyMcE7v/sL0lv9rBf5iYDUAcHyohNS6B8YDPreIcmccldoa+fUNCU3bQ+W7
         5LuRgzYD08UIJEPHecwv/58iyzN+WTggVpDtOPSMh+CBsEeI7PjvG1dn0uCcl8JCg+48
         Ttz+rw6vj0BQf+sBxwG8uDzi5Gzka2W02E/w6Jor1nHXkebAGmxafmSUa5dvjsE05PS9
         aJmVb4Sqdx33MOiqPYtCQIQFhvdQZ4EfzGq1b+R+M6dEKvCD8rh3Yd9nlr4tEwzcJQs2
         Upmz03dlu84OCFrrfirpeU6KliLflQPBLA/FDcz3SYgLp6qErO9oetdc8kHcpQyR69Yc
         CkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+VoVD0mcXpV1MggR4ErXmkAv8TrwJyP5fq+IgqqiIwCgigc3xvwv9sFXm0DoZfFoprlXH1aAX+bMVaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxgg0xvjd6gUvi39cU2cKsHiplnjdlNmFQXqHtaNaOy+XgwPQg
	FZkMdk5+ifc0kHmzfv6Fs0Rsy2hbpjE8jEy0KvNkMCrUUqdOjQjV1parzaVDzDMsd2s=
X-Gm-Gg: ASbGncsSnJTdQ8cl8fnCmc6IwuRQmXlJw59ZUVBwS3H4pLtA1PbUHFshtOR/HmmU9oz
	caAN9RtCqgDkgK3ns91BLXQTEOUw0W/8oQw455xjjetPf9OUv2aKHJ6SbGxiJoCC+A2gVyFR+2k
	g7CA2AIZDHCd9OfW6UPHwoVONiZ9KS9A3jPXXwsoe2D7GRaP6ADhvvten3wPwWIyqTLeJCGdq7o
	/H1G4quvQ4xtmhE5JhxX7mHuVAAclvxpX11WyA/ukgUjbCAInigkRqWWFE3cBLuEtOXWstk+GQ+
	pEQXrUTlxSwCnZHJTpeLG5rNzS0ebAROFtWzRw6CQ+VmEXW6KwUQM4qNGzaBwxUlCdwJjUwqlX9
	8nSvk+stXQ+SsvevHWgV+w8suiPYHNXMIRd9YxU0dJIA0ffbAyvRNGlFME2H2pP3yU4E=
X-Google-Smtp-Source: AGHT+IFVifTAJZtaYHUfGrIgJKVup73904Jpxi3iJQtxs2jFFAnZeMblxxiGJ+7YSsPUQmauGBlE4Q==
X-Received: by 2002:a05:6402:2105:b0:60e:f46:326d with SMTP id 4fb4d7f45d1cf-6149b5a9c99mr2747658a12.33.1753280461684;
        Wed, 23 Jul 2025 07:21:01 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm6803870a12.51.2025.07.23.07.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 07:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 16:21:01 +0200
Message-Id: <DBJI1WH6FF2U.DATWTQ5SP4JM@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
In-Reply-To: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>

On Wed Jul 23, 2025 at 4:19 PM CEST, Luca Weiss wrote:
> SM7225 is a variation of SM6350, and also needs an entry in the table.

And now a second after sending I checked sm7325 and that's also
missing...

>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Note, due to other bugs on next-20250723 I couldn't fully test that
> DPU/GPU are working, but this seems to be required in any case...
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..9fdd169f87a78a486bea88230=
83bef08bc5b9521 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -246,6 +246,7 @@ static const struct of_device_id qcom_ubwc_configs[] =
__maybe_unused =3D {
>  	{ .compatible =3D "qcom,sm6375", .data =3D &sm6350_data, },
>  	{ .compatible =3D "qcom,sm7125", .data =3D &sc7180_data },
>  	{ .compatible =3D "qcom,sm7150", .data =3D &sm7150_data, },
> +	{ .compatible =3D "qcom,sm7225", .data =3D &sm6350_data, },
>  	{ .compatible =3D "qcom,sm8150", .data =3D &sm8150_data, },
>  	{ .compatible =3D "qcom,sm8250", .data =3D &sm8250_data, },
>  	{ .compatible =3D "qcom,sm8350", .data =3D &sm8350_data, },
>
> ---
> base-commit: ac3f0fb04c50a909908fd375686c5ad6b27bee98
> change-id: 20250723-ubwc-sm7225-19be7c2e7bdd
>
> Best regards,

