Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173B34BA3F
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948383; cv=none; b=ZCyg8wvjNHvZ6AWlRNL0lRLTq5uOj5uBY4T4kQdPgyk/eccYYf1dCmcG+/p1THBcP79czYZhf4ohcVCi8We9+CDi6Q67L9OWnGg9T9662oRaGkjD16hyKT7vUuf8YbvyNf9KUK/QRIAdCtuLv/i7wVScsl0+MRFngUW5N5iCPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948383; c=relaxed/simple;
	bh=qDke/BM2wmbXha3fCsJTXgNDkLrvuoMC8xxXT54rWIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDzlA3rBcaDESxAVtHsM6TwHwZnLqJM5DUx26IRluRZ/imb4jgg41CeIc9pvMi7gbTMxSquPSJw+LGb/LT4Lzyr7zbn+EvrW7fhMqhSDtWUOzjHOgBMjtOjgVFnc99U3Hpw0UR8VSPH27+aJuVoQUZ/in7QPrZ6Z3eUxNDBIwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBn02Xab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBn02Xab"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HMf029177
	for <phone-devel@vger.kernel.org>; Wed, 8 Oct 2025 18:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uFD4df5RVTDSBvx+9GtUJ4Q7
	lrBDG5kW26hkOSa8Kxw=; b=kBn02XabcCGocFusnfHbgnDuQWz+udQzsY6QxV/X
	NupzML/17+PkjCXr2TSO/QNts0KXHKmDsfrVRZVlWrjKwchjJqKrHN/Ilyar6hCT
	xMojJyUMw91HgYHLcATnP8bgAg7jrMH7JMszaDxhljK0bcHJy6WYwIQ3kyaWlDX6
	Ttczkfl1vHfXeVDWzrs0Zx/MJrY5WGnvnjJZuvF6JLb/MoRUjI/aqTs0o5bYQBU7
	RZMWR1QEnHl9XskyXNn24Y/VFx4nj9IymCenT2n9lg9pCjxeRyGDywL5RaHEOuir
	BbHeKmry/irlA05ieDpKqINMpVTA1teSnErBr7N13Wi0oQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sg8bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 18:33:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dbd8484abbso2303711cf.0
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948379; x=1760553179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFD4df5RVTDSBvx+9GtUJ4Q7lrBDG5kW26hkOSa8Kxw=;
        b=iv/DRXPHMBCg1z2Zm1dyzZXIl8udWrqfnevtHqyjdBlwcF60KYaXn8azHb8gRvn21U
         can2v1Vi+KPKbmWzTM8+wsjmmUenM/N8+2zC3neBMljX42+sTsSpvX/EqJbH1Av4XK0h
         iFjH97jyK2frxsu4tkdJBC3Tx/zYDzNKhJRItiBqtx7NFC1/bxyLCo4JcOeeEgkWq/wb
         R7PVlT/NIk3XfrztQ/0hrdB2NH4+ILo51k1bLDAZSkH8rWj+t0kOJtM/IZiJa3aJWmY5
         x1gH8dqLvLbjv2TuRZT0TWIYjha1RzGJRd0JD+RbfennOK8MsapXpI1/Uw6UEz2azxiW
         pFEg==
X-Forwarded-Encrypted: i=1; AJvYcCX96mcsFus1jqlsM/E0fj42xWw04S+5fXuSudWgty6eP5KHmCt+s8oghwOTHDUmEqPT4YcybR0RcTD6jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkgoT9iNzgXnp9mL0ZnK0PQlxcYcTskv4/hUMazkQKTtUOFUme
	AHF+WsKi9ZjXHGqnvK08lQ5SqVcEJm7wua+C0miUuJEOWcWUUrxK//fR4jVmScnJtZWcpOYOR3g
	vuxZ99RxKjtRAekkxE9l/eZzeddJYIECSpTVoohSWziMMh8VNIzFBmY48GjZDVRX9uQ==
X-Gm-Gg: ASbGncsbE8vZKhCEZoiQaA9io+D9jgIqAJn8WV+5Jy0fBn2b79cl4RnxUQy787Ne6ZR
	gVomHxXDA7TkO9zZi1/4IEWAtJCR0UNr+/GDJErp9xxGcKxjEUxlMKTtNk6+Y9QQH7jNVA6pPXe
	GK1jIMkqkxdKYKrj/m1niDa1jwEHsDEZVN7yXFYsKe0kb0b4sqW6x9pyUW4wVCRdI2IAT23Cs4s
	ztueghl2JcJyf/PNyx/B3MBJiAKfY8cTn54o/QxTzEIl2x1l6yBRezw5xJiTqFXhNvC2F7g/Awf
	i9wC/2ci4WLgw/sTJpNeEWQvn1H+waOQuPZXwqhVvOcnKczvPAGZOl0ODhtakUSaB3Suzxaq8FD
	j+yhtV//NjO0U8C9BxuE98IEZvfrF47RrrJRLW28uYKKPe/iopP3bNVMQ3Q==
X-Received: by 2002:a05:622a:4243:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4e6ead657c4mr64863771cf.58.1759948379391;
        Wed, 08 Oct 2025 11:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr6nmjALj73kuexerv1ij3pJGq6WPs4p5tau95RG0qWiEpKmUR81JMI62GzhoYVdRJukhxfw==
X-Received: by 2002:a05:622a:4243:b0:4b7:aff5:e8c2 with SMTP id d75a77b69052e-4e6ead657c4mr64863281cf.58.1759948378796;
        Wed, 08 Oct 2025 11:32:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3bd2f3csm22438751fa.59.2025.10.08.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:32:56 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:32:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
Message-ID: <q6iwjhhzr3gp27jnytm3xa4cxi7tw6h4x6grpvtnnxjwfhp2p7@25vjxdyzy6jz>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
 <20251008182106.217340-3-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008182106.217340-3-xerikasxx@gmail.com>
X-Proofpoint-GUID: hfgltUb3ZB94h8mDHfDTWVLnyIMJwBx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1ssQmA2xHts2
 12q3VqzVWcOVCqpePkIo1sUYZx0XVjvGI1MdusvQTg6O8Z5kLY/3Ed5huqXmx1zx9V6T8JHA9M9
 s1OCDU0O7DkNNeLL7qYU6Leb9GUDoX4BpHtZ+PtFNytvaPBVCqxX9hLxwYCH7QCSALc3kG+wLl8
 G6tSnwfIJMVxfu65vPfHXsPgpamyyNlpmYnKdR3aiTynwFkbIPyrGgLyuimqwVpXEnyBgN27lmV
 fm9Bb9Fb7QnzN/95yCvg26wniUPdfSNl+Y9Tfz9WY0KAJ+pn12WNzWrVaFbhG3p8wqWOCvywKWC
 Yjm/qzdGk6mJrqvCOCje2WiKNk8mQm3Fn/NiZFS4UKYFBlg+rHIxtedMT1Zfy+Map0zNLdJsfQT
 OZlVGqO3tdaW1jWL4r/0EAdpu+I/Ug==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e6ae5c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rlI1ognr9DFfacYL9GkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hfgltUb3ZB94h8mDHfDTWVLnyIMJwBx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 09:20:20PM +0300, Erikas Bitovtas wrote:
> Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
> includes support for:
> - UART
> - USB
> - Internal storage
> - MicroSD
> - Volume keys
> - Touchscreen: Focaltech FT5306
> - Accelerometer: Invensense MPU6515
> - Magnetometer: Asahi Kasei AK09911
> - Vibrator
> - Audio input and output
> - Modem
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> 
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 256 ++++++++++++++++++
>  2 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
