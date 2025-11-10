Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9130AABC
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774906; cv=none; b=QB3fo6EimTJ3kSfh4qmlrTZCcvODO20WE+X65+ipsCAITAKmZqNcqGPyGbjfFzjdqHyQHiP7xV58AplwUzqqNJc7IR36gy/0MITwYhWj1Q0RPxf929E7nsi8Uy5mT7exD4TLiC9qENp0ygHhdEWO/rg896lleaJLcRHoXdiKt/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774906; c=relaxed/simple;
	bh=4evboygHfllG7Usog2TgDkAQtAorhUspDMGXw73Mraw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=lrPTsLYkZue/cB1i0r8M6LEULiE7GdgZYxhF/nQW+YwTSrYs91ljbDZMtu0g7yZMonuQW0z0TWLBeDMDoK75gqeOLEVy0p+ZcLjS/S2ABCnliU1iubmVcU/QU9mY/WmPjk78TY7busCoipN7vSZkqDB++KtizfCzlK/sk/CnW68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=H2bctr2a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="H2bctr2a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so13744555e9.0
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 03:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762774902; x=1763379702; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSv319ON8s5k79NCoOUYSS4YvjAcOb/v3+cIU8nITNc=;
        b=H2bctr2abnNApyGwXZaxpnLxO8sitS/pjkiy877h2FDVALYcZJe6VFpFT5JevQm2yh
         up7MPJB1IgL0r9938JlykAZQPx0ef4f8KRQ6tHnG+sgR46U49QE4fDZyUw56ynUS+JOn
         kyoSEpd+48UDMWJpOnSNYeTfYfAZ2umZkAREfcCo/eAqRMkhD6A6vEH4MifHgW/anaJV
         kLfrLyD+ADOe2oJy4D1WciBjfvQOgWoR7LRBICyDIMzf7kcBQiBgTXyZo70J6sB9v7gj
         jqj98/yT2ifei5AAraWLqHEBcTJpJX0PTCamRH7Gb7SMIrvlfIWcXA2Al7ZX2aGm4jYC
         WHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774902; x=1763379702;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSv319ON8s5k79NCoOUYSS4YvjAcOb/v3+cIU8nITNc=;
        b=CI+9ZMcDF3yLuilEj3Lb3jotDK26X9K06LSfdDNyXya/Kg8qDcOL7Q1Q6q5Wgh4dN7
         kIxQemT00PxZxURvkh1G8Y9k5bI+k0RXHDZwBetVIZnayDLi2Hjw0B5MmDeNXxz39OOT
         SgF97w5xlAhZ+rogCRIirnZCGpYbGjbxytwTjjHdjyJANAxzuDLW9AS5Ddltua9A3jsI
         v7LNV6EsVPlvAbBapQlT4knS1oJm8c2MencsOgLHyjDg4+kVMQM9Q+ooUY8hS50MpZr5
         hflfXqRk90bDrHXGXSabLtVWSI2UkYwdRIIKXdS8v+IwRlY+i/zBz/TpqsPbONnOwRfD
         u6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMAk0zVJKNmCFDA0HxZhhunmDenGRPX4esuHtGH99NmdQKmVTv9WQ2BbcrJVPiXrp7cE5n4A/ige0V5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3A+fR3DdurrDhxtvcMOwWmU1VOwrFUTbNs4SARyvgevLnZicZ
	p878E5PM4irjgVzl2nuN7ZJP4h347h4dDclZfMtaUBidY7rTjYi4NB2k+5P9FHqTtYM=
X-Gm-Gg: ASbGncvF1f61vt+xtHNYzCRvfvbnTXsgX7UewDidPdSU0OAOx2xQtI9cAevdgJyx43n
	oqN/QLC187ge4kwvtaacZUwc7KABKv9sxO6+V92m1xpgjSw4seA0rZELg3RGzFa4fjV6jeJ1L5h
	FDvc4atGGz7Hc4v2RLeXDkyuUwibhEcvIEebilNv9wKJVOV6oT7hmWaKC4vyje1gtr11ho7ugRL
	hzBjpmKnsuO/RD4vNl2q/+3SVAQI3Ptxc0W0bvt55n+H2BfWTmq0rurisAa/Jze5Pp5oVLAu1X5
	iZK9Kin70B4b5Vbv2ZJaKM18vV8TO6HUI0iJAQW0w8n8NsTlvGI+3+1joAHfEAdjtEABSGsWBAv
	6W9VQ0mnU53EPWj1zEXxmEavKZEmyjAJl1d426bL7dCkba2qvCY3P30e3eXwcyI1lEw/2GIHAJl
	9/wCi9N8UTc6Wwzc3BgGTEPaosoSU+uaZxfZgXIJZQO1+HxmQfxW4gKY6Ctg==
X-Google-Smtp-Source: AGHT+IHgURZ+2ALbsYAeFytpaGuY3bxXAOFksVTI2Vrqto3KQB0fcrxUmYbmcgxUCetGDJMVEYFXbw==
X-Received: by 2002:a05:600c:1ca7:b0:46f:b43a:aee1 with SMTP id 5b1f17b1804b1-477732a9d90mr72371385e9.38.1762774902061;
        Mon, 10 Nov 2025 03:41:42 -0800 (PST)
Received: from localhost (84-115-213-210.cable.dynamic.surfer.at. [84.115.213.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm247107225e9.14.2025.11.10.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:41:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 12:41:39 +0100
Message-Id: <DE4ZJT518WU8.1JNHYKMU3IBAQ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <david@ixit.cz>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Petr Hodina" <phodina@protonmail.com>, "Casey Connolly"
 <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: "Joel Selvaraj" <foss@joelselvaraj.com>, <linux-media@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH RFC 6/8] media: qcom: camss: csiphy-3ph: Use sdm845
 C-PHY configuration sequence
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
In-Reply-To: <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>

On Sun Nov 9, 2025 at 10:39 AM CET, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>
> Enable the 3-phase (3PH) lane configuration introduced earlier when
> C-PHY mode is requested on the SDM845 platform. This ensures the proper
> initialization sequence is used for C-PHY operation.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c2adbde6b4e0d..03f5c4676e89a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1103,8 +1103,14 @@ static void csiphy_lanes_enable(struct csiphy_devi=
ce *csiphy,
> =20
>  	switch (csiphy->camss->res->version) {
>  	case CAMSS_845:
> -		regs->lane_regs =3D &lane_regs_sdm845[0];
> -		regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
> +		if (c->cphy) {
> +			regs->lane_regs =3D &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845_3ph);
> +
> +		} else {
> +			regs->lane_regs =3D &lane_regs_sdm845[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
> +		}

Why not add this directly in the commit adding the sequence? Otherwise
the other commit adding lane_regs_sdm845_3ph will just have an unused
variable warning until this patch.

I think it's one logical change.

Regards
Luca

>  		break;
>  	case CAMSS_2290:
>  		regs->lane_regs =3D &lane_regs_qcm2290[0];

