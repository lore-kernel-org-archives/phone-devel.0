Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D51F2365
	for <phone-devel@vger.kernel.org>; Sun,  4 May 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375233; cv=none; b=FPe7H2qcl5ZWS8ua29Zos85POB8Dm48ZuV6OcCCoznasJk0ZH6gjyZ8qnSW6+LGqeqtzdItATm1qvvTdelxPEr31kkvpRdLDKWYW2wTSJLDaSFbc3o0X/uxy/JqrWhyDIso5u0EcTIo13gb+6d6Lm9Mma7BPzKVejavXfGfT0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375233; c=relaxed/simple;
	bh=97RKXDzDoG8OCb/93VmDNkU0PVNnI64ZdE+LfZVjE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUV2GxysMXYdeaGyXN3xSyCxJoihl91FNZSD2jcdSaZxVCMgH78kckvf46AD2pPKYkrj5aNzlMpSHxpMaEoaGq+QAyy8+w+uFGMnUax3TKf3o3mSZteDV7TYW0ateeT7LWYa7a4jdz6xiQ8U01iGiIh5MrYOlx3IggQ3zWPLuz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZjDiq17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZjDiq17"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FtjtY031973
	for <phone-devel@vger.kernel.org>; Sun, 4 May 2025 16:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=aZjDiq17KIhl1ALW
	clqtbi+CIZdf2/GxD1LQVuQLnsOWSN3Sc2+Tb9lKmIKCJHaUzRLENzKHOXxRxdbl
	+kxerPxTRIiT3GSURePl27YOfEoeg4pjbKH4UPMLMbg+7lthLZLzPJOZRxyPk1rI
	cAahuifJ25pVkQ1EUSefDjPRMo/VGLRfE2bnUVYJBXHE6c7uw+LVaNwc1KvsRwXZ
	XfjjKcJ19EeqqmGm0FXFb1yiVvMVTLIF0Djo9VxBFjqZnFJjqCUxm8db39U9WkMd
	stwaAP2O6Jww1Sep7/uHuchriqAt+49mTUQRAZ4T4ofFk23M0XCxGNRZC/65P0cW
	G0btTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5a6ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 04 May 2025 16:13:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e703so696605485a.3
        for <phone-devel@vger.kernel.org>; Sun, 04 May 2025 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375229; x=1746980029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
        b=otTERFARO6iRLZpuyd37YJAxg41rAtu9jqISdZBA4Qsd7f2LX+TKsM04dHNR+HYRsY
         4ZsJDZX0g1QY+L8oqGB6XR59zvT2VLcqr/uVSEJg7JY8o92zf6JRRo02V5l2o86PZTJh
         FhftAXyBUb2H05GjGbdREjNPgXnlS6Q8ujLX7G89D4cikKUhqS7uEV7BEp1VaN3JGQ8o
         NtbDIp1SbI8agCVP+gD7g1zCAbnQ49Nok955BoxJubEHTDb4fc/J+GDEHizAj8xi9PYD
         idV9cPX6PCfUW9cW6AkPpAh51a3zA+40N8XVSzmyjXJ/tw+N/i/xPaD/sEsvdvFix79k
         8YxA==
X-Forwarded-Encrypted: i=1; AJvYcCWeHVf5ZTmo5Cu0itLhdynBuHUSLTgQw7zsusDriYIr3KsY5vO7Viv8kOn41qLSHd+0zJnIR9LlGDmu6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7ivX49vJeuyt6UL4xv5HFL9iiJK4ektqIsmiMzHSeuZ3bzHT
	WnvYHGG9USips01+xn4AmLjbf61hshXk2ldNxC9kzBfcO+MW9CzMANl9ACoXTh3ZX2oL/YPAQ8C
	1omFE1iDrWWR4Wz8xNP8k/Wd6cABXQC2uffEyotSzdRwwT9PPfrRnHCHv+EgtHQ==
X-Gm-Gg: ASbGncvFWrBLnA94OS7RlUmh8s7rrsp5HTOFUBgnpFZGNCNB9KGjkWZ66iueKw0hppd
	Zrb3Mw/NCfMWjewLX3DgY2OYuXzm0DDUEnEb8jLFlhPguaoBL011lxZkxpqCxD1WTHn1lTyFzC1
	Z3gA+7oJPaXF2dpHhrCSSSmHeOq6DcGptT6NXjthtBJdXisL4TovGt27vW5G5KznJ0mTlqTtKrV
	Uy8a2btP0r9QjSN/t3UMnFgZQVEq8iiqtU4A+AB3KiaRm4DOQWXzt9TWmkyNLWaiUzBovPlk+cc
	Q0HfhGI0bA6rku5QwYk6Trky2OefCtrDTf4noWWtthRPkYYGhxWlXdKNekEs2zeof/fi0czrWfS
	GPajB3hXwvNY/1oVbR+uDLVRy
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cae3a89beamr601652085a.5.1746375229641;
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOpfARWuH6M/BB8J4jIJ9/rRDdEqKJLyqrBgH4bY43WfHx9v+3pxeLlRyLuaD9LSQ7iLIxnA==
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cae3a89beamr601648985a.5.1746375229307;
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:48 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:28 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
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
X-Proofpoint-GUID: Y95avgOK1BNVZ5sO7OcVs4qAfaq8OHxg
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6817923e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Y95avgOK1BNVZ5sO7OcVs4qAfaq8OHxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXyBQQ5fy3l7DI
 2tYFiEP95kVffTMSKruJKSEILzUbAoFzTzrtixUkmcWO+R8xJxNGwRX3v/8fhs98sq9U7YaRTZH
 SIXHOm8VM658iDIA1dFLUAuBWz/OYntX3Ym/zqVKPiJhqGFva/RZ4n4Bxts0UATGPRVK4swU36M
 MsMYVMGh/tU0QmDvlIefakcpx6YCzbjfP/rHq2yNy2LdwdlHTTXD8UdFZJ1cnTNQAruhm6I19hF
 lkVtF4jqLKN9aM8uZhmlG15f923A+/bZICFlbw/co09Pe7BaIyHrGN6xJphJPyPss1i1XcLEDMK
 dFctaC7XKxM4ZB4HK/MwO+OWiSrKcTTAjzjx8Dhc7rtOjUBgi39ZgjdkWGNxm79yXFmApOO8ydN
 5x+CT/avApnP+WdBeWpXQaJhGZs9M99/ZfgCFVz49sO6dPfPqQ7h6hQsqcz1TMR31pTrFsUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=925 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


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
