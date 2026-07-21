Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7D43B6EE
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674431; cv=none; b=J5KyC1ebI8nP8uuSiEEcbly9Dn8KvjAocOoZktgH92Nzszd3xraoMhRVAD15jGIom0W0YurIWAQTdDF4Te3//KPVXyVHMgKLqFKSKSfWEQCaTmxP0duWaG2XITK6AAZ6LBEwCW9E71lFhb718hmKjqKukk9fHoRidvXampvXN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674431; c=relaxed/simple;
	bh=tDAi4IGtVx/zfl8u1l7AFJDNu3zxE0dupcP26fR3FZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv1CmG+gGn9yKSY6h0YDhm0zMk3d0zzqvS+rBWiopm5Tw3i+VsEv312VyWFLPD1xgKn5hK/Gh+l+OSGd1vDO+1QyvoqYppo/s6HoRm+TnB5SKH6ZrhLi5bd3H6r+HFmru4QCbz+L/uYai/E4lSkfSeOulQlbwDJpmND+DQxTPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmJh7sO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvQFAl1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmJh7sO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvQFAl1F"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZNfG4190046
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mo5JOHCdyujbRKvDz9XZRfjh
	a+Z4tfZA1s4uWqbxDko=; b=TmJh7sO0lGVISpcBmTjicWZWg9ZypS6ZdD1NdWp4
	SOAh9jqcjoakNevBm8c7yCGxLXw4l4W0Cj2lMCJ/cNRu7/4VZLPkioMgEiumfi8U
	PWiYHq3z8/hzIdGmqJlhml8pzd39f8Ey2xvWJ4W4MaLREMhPcbILncq4t/+xR2v6
	i3Oc7SrqjhN0h2WOWU/4aCLMHe+GIQz8NG2wEYoI5Re3VwEUzG56VDajAyduSyGj
	e0kOCLTiiFOKcfHEO426YySHMt6xyCZgbwNPC8YkMvAKtXsp0cmKbmWig0Dt5dJY
	XfOQjxC3+pkHMk/wKpP9cCSV4s6PuSWwkhtKPafy5+YOyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsuc34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 22:53:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso41152641cf.0
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674428; x=1785279228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mo5JOHCdyujbRKvDz9XZRfjha+Z4tfZA1s4uWqbxDko=;
        b=PvQFAl1FEtI4V8lu/twZM379uxpGi+PMHCud+S6TikrHY5ieazQa0I+XdZ2uzCYAWQ
         hs+tusK7kXFkAGpCcYDdd6CBta7VD9aLJEtT9a0FhlEdg2OBEvYHR8n+pRxFYpNPjRk1
         UHsjMP4ytThma1m4NdODdAQvjcQoF8R4VqnnjatvnGZ5XKUqkByndtH+2kz/oBG9TNJ2
         PYMX2nBJsZIJYZRmKIygD7C0MSh1VRT65RXC9B6XBcLrVmFjHz07/uh5cUx+oho15Gm6
         eTs8hTKWNH85ALyS2FdmDrwYaPW7XCAUWK4qEWcXvDTSvAWGUMnQ5ophpFpUyE6Mjgsx
         X/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674428; x=1785279228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mo5JOHCdyujbRKvDz9XZRfjha+Z4tfZA1s4uWqbxDko=;
        b=kxw0gIiaL3xqGlOCyuOLwGX93CL0QDkVZ8MLc74BQpT31DHHM5sNY8HzFAiGEdbSJc
         nO3FzNLpiYAaT9WPvCKesQEWbB299Y2qsDCNv4B0E72mCvtaT86drRurBihR4YOh0Duo
         sqb9j3dne8yE1CgogJ5E8T/dY/Hd7s+KRNpgZB/4jE75zS4rPssHuQHHYL22mKBlLvm5
         mREkJ5Y86/o2Jlf4srMjkVrSDkjzj1Pit5gxkzmYUcSzthQAeti3k4RLYYOS6sWi+zOI
         FnfkZ5l4I8Kqr3jRo3umZsb/NZ097xuZaoCz1+SIiPqtV9ubtHn1lcr32R6VH4pz3Nbw
         n43g==
X-Forwarded-Encrypted: i=1; AHgh+Ro3h0JQVBl2GLIbvEKIKGsMm22o0C/MGg3fQ82kWX/XNMgxMhoruFRjFk5hOPFWdBzK96+/h6wD8O+Bqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9s6G9v+S9Z0n7zcLXOYZCiRms3R5mrrRpK3LyYcM7MxRE1Hl6
	nZ7qJx9l8Wui/G69jyrgBjRaFC7pRi2sz+6Anu4Az4k33X4tf9MMMYosDYARG5lXTM2X34Fhgmy
	Qv4Pe39E1T4hpKYQIqQdSlMtEO8WMmKu5ptsAsnTgpoWvm42Jw07i37slf93ZAAjLQg==
X-Gm-Gg: AR+sD11ThR9tj8NcLz3VOUbSLGls2p5RLJmHS644oFVm2mOmWRxIFSwuV7kP2pxD/ZA
	9mVn+s3Frm9H3kVgJGJbBy9vs0n/dpS+HKF56VxYYt3hsPqPvSQ0a2fiBojK38OOg7OZrxerGnr
	rZkgjMguRAenC8kkgEraqKxmUVXyryATbfN6NiYBtu3Yn6YSdUS1a7vZoNHm5iGR2h5JiN4RvQ5
	DSH43j8jLKs/LKxtJIcWS5IugzMA1WEGG+G3vx07K8T8m22w1KZg0flyHxNfHPRZMspE5u1WGQJ
	RThFROwtzTzOAYr32AMIVirlm4P0LBkdD7pjXcnif4c1ZpwIjOrh9XKWWN/Nw6WJRcMf7MHrZfC
	JbDj5gHTujsKrULJDaX/j58O6ajCHps5rYn3d9xoAFiwf2gmCBnEzHfeR0gKjmFAudzCyLbiJgH
	5Ni84lATdyLQ1gzg==
X-Received: by 2002:a05:622a:408c:b0:527:7122:3f2f with SMTP id d75a77b69052e-527a8b482bbmr18157441cf.31.1784674427818;
        Tue, 21 Jul 2026 15:53:47 -0700 (PDT)
X-Received: by 2002:a05:622a:408c:b0:527:7122:3f2f with SMTP id d75a77b69052e-527a8b482bbmr18157221cf.31.1784674427399;
        Tue, 21 Jul 2026 15:53:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9b006sm151389e87.23.2026.07.21.15.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:53:44 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:53:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add support for SM8475
 Gen3x1 PCIe0 port
Message-ID: <ipdehqlooopyymdvh4ngojgams5r4yut2ojlchf6e63xvnt4tk@7xmndg3cishf>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <20260715-sm8475-bup-pcie-v2-3-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-pcie-v2-3-48bd91a19abf@proton.me>
X-Proofpoint-GUID: 8wu5CcSXlprR2cqLofoX4tcYnYe-PUCu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX+/k1mMWQicsg
 hOINZY24pPZJYJoKLZ3xNWZkaLAOgZQD/PXm9uB0a0XfO8hZZ+1+GqtXL6VlXMSrAFKDkfGB1u1
 2KqesM+ArDk/vGXXA61lHAuB2YT/2yY=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5ff87c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pBVXu9Zvf4h7QG-lshEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8wu5CcSXlprR2cqLofoX4tcYnYe-PUCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX5jXccsV0JImh
 FbB/ruEIVpyOVLulFhjHuOJ+vSVp9DndqXyQD176C/Aw+kCqEHaYRPGnyPAlBI9v6NAE+kZm044
 XBEzg1/3uFm9IHH2hFjqopvlRPSS6ZJFaH7wTkxU5I1NIpqqgTPYXD/EJt4wmzYj/zrtwY1ansh
 QArtHvcpqFB99WG/kAMWJkzJgB5LZa4ZnljCpbdmF808hj+KUC/tgPUWZWF08M+eXPZtF2VUzyN
 a6fHYbALaykL2Cn1fXlDeoCWhBapMCt3TMyoKiBeK3x8mrtdCP4G54YkLDbVroXSl2Cm/VDTiXC
 RbPB+cWSHoO10Ams2kzfwwLO8WxRRv0A7fhDcZ2Q/Uk5kh/BCFHzR1phA7ot+Te+Y4QCbil++yF
 ovGyef+dTZNeQehPBP956gg0TGwMNqNeCz+4hpz7oj0lgHOo5qArja0FPd49wdy3WX99qtGR167
 O0py3yywBkZIFjImCfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210236

On Wed, Jul 15, 2026 at 02:37:48AM -0400, Esteban Urrutia wrote:
> This gets the port working. Tested with WCN6856 WLAN capabilities.
> Serdes, RX and PCS Misc tables had to be added, while TX and PCS tables
> were reused from SM8550, and PCS Lane1 was reused from SAR2130P.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 108 +++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
