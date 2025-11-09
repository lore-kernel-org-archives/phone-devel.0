Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D563090CB
	for <phone-devel@vger.kernel.org>; Sun,  9 Nov 2025 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762708977; cv=none; b=VF2pbq0byEJWE17VE4bK6SJvFPknIKcxBceEh54k14IUVl3R6WtU5cDyqhPxkpMUEOmPwvGw637xnErEtIa/t85eq9ifV7MEZvutpD0oOHByTaqkgmxf9mDem1nBzcpiNs3YGiwM/MD3OeU8XnhKf8wYeP7NMkuq/YU2sf4uD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762708977; c=relaxed/simple;
	bh=8xrRb4Ja7YDYCikqkpnM1+9xLkErGoSE0Ilyg3K603U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UHenM0r8jZ4V7gisPoVfwspP8LoQJeWz/z33WCGAQ/ltuxnEwNKmseD6l0+TYaexRfpYOoLNosS6oOztMJRQz4Ah54PZMwb5VGyqe5uK0yOfJHaOzxuGq5zVuKNa7njYYvxaBUtlzLHa58SVYDnJm+LF/fvh6jZdLttc3DHO2pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tlf32Vm4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tlf32Vm4"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso1223103a12.1
        for <phone-devel@vger.kernel.org>; Sun, 09 Nov 2025 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762708972; x=1763313772; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7u5viM8iOHpulamZW8Yl5pjwnfS/F/QVQpeIUIajsE=;
        b=tlf32Vm4NVrasKbkE996+Mj6XQVE03iUa6BZr/4GVFSrrOzf3ZgZdS0WAMnZw++XHF
         wPAmk7eAJNPJSm8b9OfBtOjhyVHnYWFl+Q78i/d/WyVjXGOcMz8PNpar9PYBq6dP0+aa
         el5n5PPNIQpi4CSO92ADIdilnEVstRU2D/PH8dmGQYeVO/PVWP/yVAjg+U3kAlyB2wqR
         xHHRnazDTd7x3VviVzdyGH1a/mQw6NJ/xm6RJ70TGzKyYI+EdfBPb3G9VRzTLgfcVfLo
         7GKfazWZWyc/lEa0gNbGh6VeOLO/TB9YDYIo2I/UxD1zTGmnqCtIJrJHkJFF5pB2+Nll
         2/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762708972; x=1763313772;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7u5viM8iOHpulamZW8Yl5pjwnfS/F/QVQpeIUIajsE=;
        b=DE/RVsqHmGe7Ojk9TdYFa+drGkw8SrMx2m6uMq7B96CalxrBRJ4iuCEbnDqiRJLThZ
         mRjqa+3XFQ3NLPxZ+c2yTHrrQGaXUVJ3q1bE6fcm1OScDYP2ZcIE5vx6pq16L/4Lt5hj
         osWBiCx6m6AN7iWV+PVDPk4boSRKlJpOlXVZRt/aerZ2VcfewGvUmzfszLWUfgnU6def
         V3At0iawmJd9BgtgDjNDZtW8t1ypIFs2In/9OYlXKwbr2xQ67ZJ0Or94B8OVXyyIHPfM
         zJsJC2ZLhwjbRCIIXWxHdTvBpdDoxv7c1FHOnnCEzbskJEqvSalqqqtkiz2MyJRhcOFf
         1O8g==
X-Forwarded-Encrypted: i=1; AJvYcCXuk0uVvJact65koSEZ1xVzRekxCK838Nl+BGZtyx9UvcK4XeBNmK7Mj/+UShajshbQDIJUOeO1MGOYMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydxWPcH0lMthrHMJm56365XL9KILlfqguFY0sKf1bdrxpCsx+D
	2/tVXvJe1xehxwqlhRrQ4OjHfWtQMSzoaI6DSkzGH0sdJcWfP8MBrHGLsRIFf2spgeE=
X-Gm-Gg: ASbGnctx+DIDAt2MTWQHZRHCUYJz8IznsQq04taZshRruUY434kOAtQ0Hogyl7cvTob
	h5m1jATnUOcjwwORZHMu0P5m4EoWVkrftLYwMMcMWn1v410aJo+sSxucybr/Nrv8ZFX61kXpk1v
	n5sBq/Fpmx3Snf8BCzyVUjSR/Hyvxg1oGfvmN3Av5cZ7NSz+yan7h+0+RbVwRkKsjbRhi55Tvb0
	pLPJTd6b7X6c9Dlzm7wFmEWnOHW4di8bxRlcZ0zQC/VcNmgPMSkgm7t4IbiTabneVN3TNWbzrJP
	v2Ic7cAiir3kNpzxBULMFIqOurnnL1K03An49tSKNFlAMMxr5cq/8k0AxuhrHYXFJzEnSDH9gMy
	u5SDNpt8YoGw/jR8jrM9ve0JoWVs/+bO8A4PwMAzh0mt6+f0QocNVMySdF7pb8nkmIye50ryJT+
	1EfQIAeS9Q0l1btYJNqojx6uR/SFc66yP8w77LKR/tdtRKvZVdq04edOVD7zu4iP3dFCGvFolxy
	621Fv+rMPvLVhhbi8s0BDJb7wL8o97J92I=
X-Google-Smtp-Source: AGHT+IHiNx88guNnogcxy/ePccl6T4u99WrAa4tO6dTyzZ7pWo9gTArz9LqZTlbTuW3AfvNrVuFznA==
X-Received: by 2002:a05:6402:3546:b0:640:f974:7629 with SMTP id 4fb4d7f45d1cf-6415dc205e6mr4941873a12.15.1762708971341;
        Sun, 09 Nov 2025 09:22:51 -0800 (PST)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6415d91f486sm4786157a12.22.2025.11.09.09.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 09:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Nov 2025 18:22:50 +0100
Message-Id: <DE4C6HV76V5M.1I1NJB2JCK1LN@fairphone.com>
Cc: "Joel Selvaraj" <foss@joelselvaraj.com>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH RFC 8/8] media: qcom: camss: Remove D-PHY-only endpoint
 restriction
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <david@ixit.cz>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Petr Hodina" <phodina@protonmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-8-165f7e79b0e1@ixit.cz>

On Sun Nov 9, 2025 at 10:39 AM CET, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> C-PHY mode is now supported, so the endpoint bus-type restriction to
> D-PHY can be removed.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 248aa6b21b5ad..1408e8a03f0bd 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4044,15 +4044,6 @@ static int camss_of_parse_endpoint_node(struct dev=
ice *dev,
>  	if (ret)
>  		return ret;
> =20
> -	/*
> -	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
> -	 * D-PHY is supported in the driver.
> -	 */
> -	if (vep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {

How about just adding && !=3D V4L2_MBUS_CSI2_CPHY to it? Good to check in
any case imo.

Regards
Luca

> -		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
> -		return -EINVAL;
> -	}
> -
>  	csd->interface.csiphy_id =3D vep.base.port;
> =20
>  	mipi_csi2 =3D &vep.bus.mipi_csi2;

