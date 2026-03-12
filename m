Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB83C5DA8
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322325; cv=none; b=Mi2RoVd9dIX37mfUTYJZsoG48HyTzcLtvbg5GPcs38v27fwYExa1MJzLSR/56B4jHgmrs8XyOoDqlH0FkR5NbcsmfPgSMeLQp7caY8bOKrLz1x6+A1VLHYJAxdJIOg+MaObmA2Vk1C2SOlfJGL+Qm89LLmZQaUSRTAvYvRhRiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322325; c=relaxed/simple;
	bh=oli4SE9DckFcQdJbcfZE2q1jOchUAMaYwQ7SjYKQujU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NT0xCkHzosXF8yU7+Vk05UsnOdmiZv7Hmy+JuFdDBalX1XTXWj7OxoDuD+EiF2s/rFPzdo5+91f8NGOEwTVwBHrV31Dqn0y2x5EEdmAtx59ql55Ba2GQrYkQm+Z1ODQwOBtK6dNUDlCqFzLl2U/qAo2wgWnly2SeQmfH/gKxB34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNZwPxTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JO/PQToa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNZwPxTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JO/PQToa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CDKNDV1594033
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 13:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIi1PZLcCs/GEgY7TsajP7tXfZ50qkJLYJ0/co37r7A=; b=dNZwPxTaZzKoDxTF
	Z3A3erSeuSxJBzn3mbGY3ItQvz++wVq3sUzD8RuWm5bgG1oC1ygpzSoffTgVT34c
	uA9AMKJjh364jYcu8Xb7jVy5OiyLeuMLc3FhQCF/WanIvAbjh1n+/Mb0cdqsHLaY
	niRKn/b7Gvkn3RHGszYWniUAH/4O1MVVad6ja57+0OL43s/PY1RnpgcbgF5+SKux
	awqOAHcSO+cKIuUmqdpYnkG55XUpe7/WHXQIupA55XH9i/MgIP/dBRTGCylxX4HI
	blwncXxciaCuoaAa+vK5qNslLCZfQYdElTrorjJi/NafjGVbqDr1RoYJG9SI9bCO
	YFWz2A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvq9kxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 13:32:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56b07903a75so2061531e0c.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 06:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322323; x=1773927123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIi1PZLcCs/GEgY7TsajP7tXfZ50qkJLYJ0/co37r7A=;
        b=JO/PQToa6ad0nLw7KTTB8CZrna635H5bWU44adFY3ZgPxP+GPtM+Y8LwKSGprjfmb7
         eUN5eZYbF2fCc22I+ltHyVVo+qS5JmWjCVGebsPi4vRrQmbPkxCXf3sxcDYbyvZEKAYm
         zjnJjvaWQ0RBJc/ZUa9i2MuPVK8eiOWbIIfqpmu24TEGN5ddr7B8W0wMx3aRexs72Bfv
         Q4wDKvqy8eXTOPwLS5LNzgigTUMu3hL37YJqEZ+cHKcfqma81nV7pWHHqya5IAP7lPlV
         fnlc/Q9ssxENDWpeFD43uW2jI+I4145f2TojLRqMfg1lbcszCQ8+gnMxyNrlQF6TbE9j
         Uk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322323; x=1773927123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIi1PZLcCs/GEgY7TsajP7tXfZ50qkJLYJ0/co37r7A=;
        b=LCx8upbL2dEwbo8eAb9QLO8fOtnpDDi75KNnFSY+/OsB2YicVXQmPLW9gxFLf7rmQh
         8Q0q/a7cORq3NWcyGrbYUmQ3M9ly9K1kCE3j64F5/8ulJ+HiSz1cK+jQi+Amu25rILRE
         7uYbseSGLpuZiv4xAtiNv2EjEX25ogfQGHaQCiabABr+R5gF52AY0bAv18wX/5YReuFQ
         n16TAunkMfyO0xkWV/gb1j4DRQ0ViJJD8h0NKftvOOYjCyzWL8Pp6a6Cq/D6hh16+PMz
         HBCP9zP3rS6yO/tEM+SjDcC0QYfHSXhtM6bDQRHte5dCNxz4iFafuWuoM+j/GkRIWgST
         GjTw==
X-Forwarded-Encrypted: i=1; AJvYcCW7jymGd8tpSlJJIzvH+VAkachpG7Mx/TtrtruhzWuOF6vY/svb5EaGkURpxfOo/MjC6B6Qm8IYrQ4png==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZftcAfddpUysLBmsLRbDGL+y18yo9B7RUlLP0B3T5CCvyw4vE
	dM1OccvcHECJXZZUV0SvGBqaUJBmycwRhn9umdTtp1XfeeXcMIVlJgWQV+vVemcCLqzxuWInKJ9
	e6F/KcbBvrlrTpddg8uCaes2Tal7Oj8A1aP0AKwbxtLImxiAbbvDGvICerT465tjdcA==
X-Gm-Gg: ATEYQzwRnR1qYwTwUeINseAmGNH1QON/XZdQztQTm5zCDiSz/takfNmL5sOsPL7iF9D
	JEq2tI30GDm4Np51rH1ERS6YsktfZH30FHcDlO0IF6AslWSyfDOPAnuGGJ9tKBwAgYS+IXz9WNk
	SHtXqlAJ2JNJ6wx232cNtH8PVvnMN2IkDF/SrUrCztiMNo8mRUIHcdU3DanqiAqo/CW5env/TKv
	6Z5E4kvylY24No2CZgGsAXBqThU162jn3Nm07MmxGI1DJ1qTv3Gnm5WR0N3kXv7HHMjVWokGq07
	ej5q9wUQ12u9EywVNob1NC1CetDMfg0BgbNFdz7H4AjaUaL8lrJEPOr3dkV2hj+7lj9DKb08KVO
	EN9fW9vwfyNNp8yf0/8yZvzajCz3rNKcmCwZZ8bVOzddDipd1N2L8fB6J74WkZa6ZkOmx3JX8k1
	yymNtQfvdX/goJb71q8n/SyD2a3CdPSDRFPx8=
X-Received: by 2002:a05:6122:2a52:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56b47438c2emr2410952e0c.4.1773322321005;
        Thu, 12 Mar 2026 06:32:01 -0700 (PDT)
X-Received: by 2002:a05:6122:2a52:b0:566:fe6c:e1ba with SMTP id 71dfb90a1353d-56b47438c2emr2410621e0c.4.1773322317270;
        Thu, 12 Mar 2026 06:31:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8656281fa.9.2026.03.12.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:31:55 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:31:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Message-ID: <vjpnt6xefyssqlaivlvhtizlnlw7gfsmwtexcc7ukccwhgfeet@egtg6oe6za4c>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
 <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
X-Proofpoint-ORIG-GUID: rB9Z5FEmswJLTZ0yiYY1xrJoTSmUGb-t
X-Proofpoint-GUID: rB9Z5FEmswJLTZ0yiYY1xrJoTSmUGb-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX3PcWJMGVykbM
 Xe7VIo1+PoGiujvZr/z5YnqEOqvtch5267yN8NpsRcofdWZSBdZVvh7bQJ21w70fNptYcKzwWcD
 5bfwFgcn8TKGCZgd3e/s6zJCIqGDyAL94yCTAPsStolqMurzQ1udoaKRYI2is5jUyriFSXBYeUl
 Cf0eOIR1kBz6tv4M7Euduc3ztzh6x0BKhcDbVWDtbfeqhSLLLlWM6qpTrtslzLa3rI0dGZfSaDI
 vre94/42dPBwN8sQVZS3De6PGqfw2ag+vwhJmQ1i3cNCBx0a+8iEDUJ9m3UOLkO+uf4l3bAyeXE
 qGvJfdOw/iRy9Esf/rLT4zs0LdFEHM+QBl5Dd9IT+ppJF2lQb8OEhQG74mBWQpEX1E4/QNyPiF+
 J5U1EUMeU4yhSMe+tleRgKufbwhmjHi1QifjTRP+7blhEI1wFg0Js+Y12SR65UWTMfx7M3abDrp
 YREdRKeFrxEyHotfiOg==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b2c054 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bqK5-dEd6McJkE9xslgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107

On Thu, Mar 12, 2026 at 01:55:10PM +0200, Yedaya Katsman wrote:
> Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
> DSI controller for the M1906F9 panel.
> 
> The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
> fine with 2mA, so I used that.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
