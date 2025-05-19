Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9B3274673
	for <phone-devel@vger.kernel.org>; Mon, 19 May 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652340; cv=none; b=qXLEQ7Tg+cHWOjmd9frZVVzjqWuxAe0Z5tKDTY8RGwviim2RjphonpQYZtTFd9tH3WIrkTlI5EkBZms4OIrXAv17DmSm9aYB5rTxBx6F36iWe6LpKEPKmgJZNxj5yItC3DJvOwB0zCz2//OsrP8E1O+hBozMDCU2IMn/6ZnO5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652340; c=relaxed/simple;
	bh=97RKXDzDoG8OCb/93VmDNkU0PVNnI64ZdE+LfZVjE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SP1zjo/PnqFkyr5HEJ35w8orQg86cQrtVrE0LpTBehLms32/yzFyiDLPYdHeM3Rj+wZt9R2li+X6jwhXyPzvCbRQiMD7jdjvpp8TiIBEgr0W5Ni1728RzkQJnMTTYaWeoTV6o9ys6mLVdq31WubjCEzlPKz7zafUjQVLDiGBjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjF/tVJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjF/tVJV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ivN4022840
	for <phone-devel@vger.kernel.org>; Mon, 19 May 2025 10:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=NjF/tVJVpJp9dnFn
	yL97Jgn2iUw0DjUTbHctm9R+QtGTwvfaFe88tvwg80d+A9CDrCNtQyDuRzC+lMs+
	KHvSdl7O9WApTPpzDiP1Pb8qXvc8OEh5PDpMj4al3sSsMXeKyOGJe2l6CaBtR75t
	GxJuuFCOreqNhlM/DAWIn7sTfncYev5bL0rr78iYBf9W7os0Z3u16f6FWVviStwm
	gKyRpWKw5XbAigpZCWADerZ7qZzf7s+9i7Sxls8yhwY5+YtddipxDvf1J7lxEu+M
	YI4626r0kYCln6/pHHH73sLlXwFLe++XUUHQ3/FvKdYG8hB+M3qyVvgVgOcGvTvb
	BrhoZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d06r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 May 2025 10:58:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e114ef64so3501456d6.1
        for <phone-devel@vger.kernel.org>; Mon, 19 May 2025 03:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652336; x=1748257136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
        b=gKtEzyhDHW2VgEAgWYgygl/nBUn42GAlQJCNAbN4+nOr4dkI+5Bt8PjaGlhUCeSh2I
         OO3bX+DFYXTJgel99C2CAX4w+Ep4XmSFuxVkK20m/NMLQmWpO6+Yz4brFNywFVhwwKsg
         03pxf+dtLdr8p3FdVaQYU0IHdWPb2pMnsNXDqm5avbtmDdhqxF1ywYeARUKr0r3sDr0R
         PUVf2covXn0nWc4EvIZihgj3xr9VbnTZUIKu8JTxvYBX0t45eqNeTe5NHHzCZ9w7JMoi
         wVIQw5P5uhUPQn1RywZmGPwaR5wTrpJxi2l7AenHK6oa6Nkhcep6eazDyTH82ndAV1mu
         a0gg==
X-Forwarded-Encrypted: i=1; AJvYcCUQERc1xV2+Uo8XT2snWNu2wP2HrLYg6XKyZEDzPGM7pBskHdROZqQF1ivU4fpNqw8kceHO4BOJWzwVNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3d9Don2B1YClVoPy0QbbV7YB1I5iEBKQzcl/6mPGEVr7Iubu
	KSJ1h9Xaq2uVOJTVO3E1DrlT2L5sn7ccM1hRuySGR+kYj6uiBPAvcAKsee6oAZrqdXd3sJKEYDw
	F3ATsJkCkbjKq9EM3BXUG6EokZRcrU+qIuvbK2O8RZ40mkYd0WsXJr3QJvU1m5zghDBa1+oID1g
	==
X-Gm-Gg: ASbGnctkvPY6ild3ctvDgF31i5pXVOdtM8dFtnm1mPEhPR06GVKtq638tIIOz/c3VNm
	KZ6jPymR9TZO4GzYrH6CMpJKkqN1hTWmzNIZXYfjzLxB8r/GtkujJCa/9ypErIWyBrkz0ZhkDFz
	7Pk004VS/kOsd6+jo6bNpVrGtwNznUNXrz6L24IlucsqFLcE/nPGMtzirfYaBo14Nua1P2WQSBS
	LE86TjEZQAxLsqOs3YjwSAhpl5PT2RF11LNKsC+xn3HMZIE7maJSMDhhHcQS0U8QULYDIqOMaP8
	S7w+g7bAP+Glh5ORLDCCwJrZO3tPMm1aHfwzfOkM3leNGJaHg+XlqxXjQ4Bde2FkgZ99S1X8epA
	JFzOLDbZlpt+sntTR0OAEtYQ7
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id 6a1803df08f44-6f8b2d43634mr196493526d6.25.1747652335770;
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh0901HTX646XfSkqw0SlUlwGL7S94w7htNY7rCEBwseDBwVnIRM7EgU1CqdTteJyLVHdqrw==
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id 6a1803df08f44-6f8b2d43634mr196493266d6.25.1747652335324;
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Mon, 19 May 2025 13:58:38 +0300
Message-ID: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX9JgzN4BtB3Df
 64CM5g9SzozWb/BgqLAAOBbbID5x8EN2eeY/KNY+5Zaum0pYZw82GF1aDwP4SNSeeGg+pf4gheV
 xnOHyoHZtsKLDozzRxYYPx+ljh+mcDJloCspRLhBZ6M8QCGzlKQquWpGNZp+okixUXn0AnRk04x
 N7PR3Y8DxIvGucBzZ4qRgusJBul0AuAyay4JynsYw1NI9XodHyVl5wm69RhG6Lf9lOWsdO5OxqS
 0kq7851syBExMwMNyhi1ghodkEq5/r3ziKAV3QcRaFYJggbzTiYKBcQrn7ieGmheal3GXQxDR7b
 hj1RkjB3/IEaOVtrAz7oTz3BiaHKQi1gByb4ivxP0hN3E39cCnStyDsZhxZN9BTqXqm2iTZix4V
 aPYRZ+pN2jUVLzrr7R8b+/qZ7iJEt7ThkCZd7L39uweRRyBa5X809Qr5pRLw+xOOIFF6CDgo
X-Proofpoint-GUID: BqdvcRSO6G1hXEvYr3OZrqvYVA2CaM8G
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0ef1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: BqdvcRSO6G1hXEvYr3OZrqvYVA2CaM8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=935 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105838.Y7bgTXNVu1rjWyMe97sZLie7me7O9FyzdvwkPPSIPno@z>


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
