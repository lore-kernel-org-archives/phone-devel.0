Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A5321F54
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537321; cv=none; b=NqgYDdzwt0JnwHOMKn62mECmj2zWv863fqorW40pHP7aMtSxvsxVIQCWA1crSL6d6UZL1v7YWPWc0vIce01Fs0YSIphpu1M5YvU2XEb2By3NyTba0HL09ry0Wwrqj3ON5MR+Izg1MT1HWUDnb76sIExp2fICo903k0yqcxWZzoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537321; c=relaxed/simple;
	bh=Sx9GGuIrjLFcxEnkWJHZB+sjQnhpDg+ynEZyANdQVMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvd3RPr6AiZ2T7zLnLMdvYLd7NRJZfLxu5G0YdaBdjSLzuprnUSiGabGtkFTnSd/oBymYbcjuR7VMN5/xHksm8knshAY1qsJ/KjiriqOBjvM/2ysnSqid3rE75fW1gmTmMvmm++RmrHCp4hM65yrPLRp6SgkwNrcFlMrIP6qaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QA/DpA+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbEs5mX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QA/DpA+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbEs5mX0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7OVQ6971176
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 07:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8F6tsr+Y0mCAYNRXqHWtql8i
	o0OKhfJCKZv2IA1/dx8=; b=QA/DpA+UCM6D6A5ksdtM2sywgq+h+LzbsP9RDuj5
	m4pK8oM2M0695vJFraUckgv8PmelkZ/N5FvbuW8WnzUUXcuXqPGFNKZgTETy+PvJ
	H2vT/dkeNSwWq0fyQWfPBA7SyqbJVUlkOX3OBCxWdyPPN/GrCTZFILzum1Ai5el3
	KmVg/oITEHLOyZrtzoJNpZsX6/6G0qjkuGQWd/2zd5C6KxBlWJABwhj0BFfbjhZZ
	2IV3vBsgpPy0A2vopTObhXvunK+UE2Q7yvkX6c7NUfgo2hrH4LxKCZvoeHamWkyV
	TpygTfkp7GHuV3qFzokgAsPzF64H2uIkiQd3yeXAq+UbwQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9fu80bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 07:28:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8803f43073bso233169746d6.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 23:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763537318; x=1764142118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8F6tsr+Y0mCAYNRXqHWtql8io0OKhfJCKZv2IA1/dx8=;
        b=YbEs5mX0r0FOxzO0Bpggd06qgdU1y4N0zD914zjiBOn75zJfeEGcxEJ1ybpr81ydGB
         z/xvPReALUZqPyRsN4ig0Bc2o5iBer2FK8XtDb8VVqUPrRx3R/cTltDcdMGKHItsqFgl
         cLC1zOyfzFA388l/LueKDYog4ph5MRPJqFzqluht6WXuP9P2AZ2DEbkJ8Q7lsskizXU4
         wW4a66t+934OW9Fy4oFy2QXau2kzgmuqvm7jQHp7daEEbIm/vJ2pvZz+7WulTs4tekgK
         dOu40JBbW2E7URAuIa6GC/II3jMrSzizHVSJiOD61+pEwihJT/uXY8bFX+0t1vE4vlOV
         UTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537318; x=1764142118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8F6tsr+Y0mCAYNRXqHWtql8io0OKhfJCKZv2IA1/dx8=;
        b=prP3ARQzGE05b9h/XMdjsj32NyW3130L9PwRr4mOPq7abDK9COcUS2Ld6hHRBMczEh
         4dxZsH536vRoO+XL5j5n5HvT2grp7iv9D2pgswhBSWQ5bnofDoOleMGmshqQwVhsjF5h
         OYSUIgN/E7md+yqAKBokkaMIwENJ7fWZPu4XYGTHGbYKI78EXxSm8OgG521v5LQMfFLD
         MXcQ2zzYr3K1vkdh3xpq7hYqQWJS/dMTGkOBIcLoOD+t98ld/TJNqOh2VzHi7Qpa6iiq
         xwIojW/m8KeNQSQdK5tNj85kZf0sDl5v6Ccy1xbuv4x6O7Oceuo1ZDY1zwqMCcOjH9jY
         wM3g==
X-Forwarded-Encrypted: i=1; AJvYcCXbvaSLJOa41DX5/0LQoDFUS3/kH852NAjmtDHcDswthNOy0+VumSGojZP8Z1RgXK6fx2M5oEw65Ptgbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHp/TFzDwF1EGCW92CdqvOmzK3FyK4wNrJfyElwquM2+7tEIK
	o/OMvwPc+n71812DAkGoonANA2Dl8sD35wEkqGgsxxnohqR3M/uaZcI0bNDCkcrBk9kW/uja9As
	UEkh1rwWcDFHQg0IGz1a8AcmGGfVQSV/REPRwIyzdRpo/vhoSwTRqrdaBxad7cz7s3Q==
X-Gm-Gg: ASbGncvKcViMwwlYJxlLAwUXXJXiJ+/cXjvmSR884FGR7r18VEAJ4JoMFZ2Nmntz7Wj
	kK4XB30iqQj4egD05BPlHAwcAbOnw84wBZY5ZCFaOZO3WK7ORHfYnq6lRG0Lr+86CYmiKUWlOOx
	PMKP1dEFIJfEMz42Ok6Pe558adwT3FwbKb7T2dJYGtXSD+LcJd8UF3UNTS5t+iTH55LmE+E+8XE
	JZ/FSEYtOM/jUxa29DdVC0FpKzeGp4rsjqof8U3Qd0GbVS9/IVpo4psEQrO8srO81gk/jyEUDFY
	iJAc37Iol3Ic7H5kjYYKGEqlFHItEMhMiF0CX62773NUEI//CqPk6lx8mtihxCOu1MpFp6WbXX1
	3V1a+l9j49scCN7xehpfQ3782ariUxgx+7zrbq1q3xJe09vvLP6OdZwXQO4qIpBU5LO98j8RqAl
	uTI9ybLQ1b4u5R15+IwmzvC1E=
X-Received: by 2002:a05:6214:27ee:b0:87c:2847:f7bf with SMTP id 6a1803df08f44-882925b1becmr231604886d6.17.1763537317606;
        Tue, 18 Nov 2025 23:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmqu4l/1lwgBqhj/Al6iB0IsTB91IKNEHwScXTc29DhfUQ0y8XmgfCWtAYGvoeLUhwuKcxaA==
X-Received: by 2002:a05:6214:27ee:b0:87c:2847:f7bf with SMTP id 6a1803df08f44-882925b1becmr231604376d6.17.1763537316583;
        Tue, 18 Nov 2025 23:28:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804004b5sm4540413e87.64.2025.11.18.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:28:35 -0800 (PST)
Date: Wed, 19 Nov 2025 09:28:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/8] drm/panel: sw43408: Introduce disable/enable
 functions
Message-ID: <sioljpees3e6sfygylxihk4kagh3dcfk7xpaydd4y5tip6apng@5zdkogftr3mr>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-pixel-3-v3-4-317a2b400d8a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1NiBTYWx0ZWRfXxjoT3UhoKMor
 SEHqa32w2IOsCpha9Pwya9U7J1fQfjBznLjdUXLUzqLGRe4TWWPuJZOBtKpdSoVrntkeHM0c4pZ
 C0wmTrQsTD2pyXpYeJTIJeeiGchAxm9jAU/9DeVcwDAF0sxouk4fsks+RGJYTfr6oizzr4KGo2h
 hAAw2A5jGIM+RIxilBWJm/iEuQxEWVrIvdrKMnGlHCxalFXEh5Br3ig2KM8uaog6mDSeDW572b0
 2tmwHVQenP+T7G9WBkFRsDBRNU5MOuVmsX5uDfHHOSDQ5qpNxAL49MJWhTpWo4eFQal6jAVH++f
 X54ofZ6n7c2zpAHRSMz67nyLF1UIhEV5nHSP/Cgc7Y3xPKNOxvo9LYRnrLAZV284ZVPmk+WprxP
 +maPJZNnuJ75DC+FdEtjiYxGdv6DgA==
X-Authority-Analysis: v=2.4 cv=KZTfcAYD c=1 sm=1 tr=0 ts=691d71a6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EXGSQNdf1jmvRekyyJ4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: L6ToEDbNVwDVyourWRiSQD4sRwcDdWma
X-Proofpoint-GUID: L6ToEDbNVwDVyourWRiSQD4sRwcDdWma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190056

On Tue, Nov 18, 2025 at 12:30:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly cleanup, introduced disable, enable, and reset function, which
> takeover parts of prepare and unprepare suitable for splitting.

Why?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 83 ++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 30 deletions(-)
> 

-- 
With best wishes
Dmitry
