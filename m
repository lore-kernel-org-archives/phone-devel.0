Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EB02DF126
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778731; cv=none; b=OsAhmEB8HLWsUTUv5//+9rs1b/hXf+aV4+Y/bxxqgfn15VP2c9nYKfAvjJycCORCZ/yO59a3fTJjHJk/2keJo297Dg2XJ/nN7f/BvDoSUKsXxGTp1vwJBnYUR626EFbhD9zSN3K3B6zFw2OslBWInr5o1Y0nDXjsxKAs64xWgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778731; c=relaxed/simple;
	bh=f76w4smlz+hTMhqq8j7EslmWV277pO2GsxXhCfGqo00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHmtep20S8n5B9njh7UJY2jo/otrarRe7A+fTJqbzJtgS5DbLXMj8EwpcOWLT5NUABNaasOj1ZwCYQqFLzF0t8ohNxyRFuFnNlxpzVYMKuHAK+Zx3V33TsvNxzynS6OjKOecmga642hzeF9FM1a6nTfqd+BO3hpwGbp3qve8ruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9S8b4Pq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sg5DYr3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9S8b4Pq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sg5DYr3y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T7Shrx1805245
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 10:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JaiqO1qH1s6Lg7602BQN0CxF
	8FKSe/qUocsXjuCSObg=; b=l9S8b4PqvOFQrX/E7BnEIuqqHeaY7rle1VyRjVzz
	0wTVMOj05Gy/uwdx6o3CEzM8DWeisasE/GRkfUGySj4dHUM7D0/a0tqMQFjwfR5p
	KRcJNK3NXlcgKlCmKs8WEjcfw9JwtJfK1hvhoiW4b9M61LGclJj4mvWZUUwY0i2e
	an1jpXEqh8h1PQWT68rDuiBNgocdiEukL2aYskBrORCO3N0Jw4s4/EIGadbw/g7m
	MNPcxFGRV1SEW7DYKOpCyyy3ZWxoxRTb6hy5l6VmdkpDy47FFkLPf4erPENYnAA3
	jXgY68BBbHlQ6yRdcvov/hBNPX1Jqd/OZ9l6lTtaxg5SqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c0ght-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 10:05:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091327215dso38613791cf.1
        for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778729; x=1775383529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JaiqO1qH1s6Lg7602BQN0CxF8FKSe/qUocsXjuCSObg=;
        b=Sg5DYr3ygG9kJ88tPZ5hbm4EPkUXlrsTl0tlwL2LXsowaa0iS8sqdZvM9Cpy3Z9n0A
         R0sZjTKfK8uhTMTA+l/+E8/Vq2OHAT3RFXtqSG/LSNo1TCs7NQ6Pu7/IjQPUNb9e9lYy
         QjG2Ne9cAYllLrM/QKbnra69pkWFSBinURSXMAYVxkMmW7Qqjh7+XgAPar7gvEOs4oWT
         wZ5BqbltI9W8igLWJTrP+r7pO8qPwUqBFqMszCN2trynRasQNOmJhKyCAIPUlvGUxAzY
         dtbdir7E6UQocEEKvhdhpR8GMBay16HbGdgCcd3YWltCzTKe1eWCyKP81TFrFePerCuo
         90+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778729; x=1775383529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaiqO1qH1s6Lg7602BQN0CxF8FKSe/qUocsXjuCSObg=;
        b=FaVvLBZcQwDFke2iWt6ktCv7XO0J74m5INO67UJvaDB8csVA7GlyK7h6SbleWe8mqG
         ErgFgpSc+t8+CDFi76HQ3dL82pXNMOv2OyuQDHOyB4dGOuSf/CTZUKl/ocFhu0AcBFQ4
         2V8f2wxqCPMz4m8dxrTjNGFxvULF+2wlJNBXWundqOS0T227KjBeZsSPXtU7aZUUxgPF
         3psA6LsCmVTWksCNyfpEN/LQcuRytRZPfSfpayJWiz80rq+aUGfVpW71mYgSuTUFcPJ+
         6Fwg4Wq6WdHnAyab7dK958QtAPfWTQlt9yMpOyVBoOH8uvs5aDaprHn4e4eUX3q21sk5
         dm9w==
X-Forwarded-Encrypted: i=1; AJvYcCUn+PVno3g+0tBbV2G4u5MjTOjK/vvLLhgJpgVTkb4uA+2JuKIFhYpdR1p5i1gjHC1iuwurKD66NyZ7FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx290D61hGcFg+IwJh0ApezUkTMuSeHfUWhGHeklkZcpCHp2zw
	EbNcmZLEgumdwer+05theDEqsqTEwoeaaXDowF7u+NmtfrTchPXpNXvDkafr16OrnAt7eT/63i1
	O+q3q0b1adz2oMafn4SfCiiO0L9A1KOukhq+OTnYKSL3YMrXPVYjRfLOog0A20HLDfw==
X-Gm-Gg: ATEYQzxy4sfuXqD3d1E2tyg1m1hM7PFOh/dY8TtRq0e49wQJsasmbJoxaRLedefGUOX
	TSUanef33QVd+4eIIW8CsgYTevomSPTmcNrNj/eek/u7S4hdQxqziS/cOfnNun5idEdJBHsGYqG
	9ypUYSZ4GZTKKc8QHABRYBAdbX44EBShHQ8QqsR1go+sMpafOYOh5Duu0H9BCpVgmav/8sr11aV
	EPT32Q2BytsrxF8XlGogrdXl09Q8SiITYdZyV5uP4wd+qb+wOjP9Lt+ODvxehGslR6DbS0ynvdl
	FRbd/AQuDN8cvicaKYyORlIGJrq/ElLkTFaE8F4fKG6KZRVaLNkCMepKotyXUTkB614eNsZzqhA
	Ry3YP8tUrVaO4vMmunY5udbV6IenY1tVprxe2lTBu3y3yz161GWJgsm5kSVMX6YOL9w9EaDhjDM
	8L1c1xUTzZbIY0HNgKNxauiGwuSD2OLvrVuGQ=
X-Received: by 2002:a05:622a:8:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50ba3836481mr121712611cf.21.1774778729066;
        Sun, 29 Mar 2026 03:05:29 -0700 (PDT)
X-Received: by 2002:a05:622a:8:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50ba3836481mr121712401cf.21.1774778728557;
        Sun, 29 Mar 2026 03:05:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8373096esm8697771fa.15.2026.03.29.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:05:27 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:05:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] drm/panel: Add driver for Novatek NT35532
Message-ID: <3qsp7fawh3wtvpvb7zvupfjpio4dhg7po56gudrttb2jcatqz2@gqhdobwalhlg>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-2-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-2-06edff9c4509@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NyBTYWx0ZWRfXyAoBw+go/IUv
 rrfT8a+nlS/53EZUt/209dkY/HClv1s5auNk2LSszTG+HA4DHGhl+opsu1K7OU75nM5fnHn9P2y
 DToy4dVrqpcUDYgtn3+jcfEYhpKECR8GNLK3y4xQ4lWKnAFnXzo7JXJNneSKPJZXexSlBad/X/X
 q9f6cXtgQITRfLwgty+0/kBViSnOeM01FwwjNV0z9ZyuZ1I7ZqgqNkFr63gOitmq58+LBg5g8wE
 Ri1DDco87+JX79nL0BxPxlbq5t1zOMiE+eBfZUHvr0/gUOGW5tqDUu4KJ6/nKDxJpI4xXkpawid
 kaM1HUZNIZeSHq64wVMmI+cX9MnxQrz6hRDfONFWefWNT5heActTrLArUIo9MZEBKE7lRpBN4lU
 kbRTWJK0I7DakUVvGUfTr4WG/ObqkuIE7rXQ4dPg2QehA5q5zrvND9GP4qjUzF0JXk9ScpGtm82
 uEJIsFVD5eFRoGGeAnA==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c8f969 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=f_kZLxWr8KFBRA8n9fgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: bZXCt3vke-4Hj0QGPTbVmCuzII75zh8I
X-Proofpoint-ORIG-GUID: bZXCt3vke-4Hj0QGPTbVmCuzII75zh8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290077

On Fri, Mar 27, 2026 at 03:30:48PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add support for Novatek NT35532-based 1080p video mode DSI panel.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt35532.c | 796 ++++++++++++++++++++++++++
>  4 files changed, 808 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
