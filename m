Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A168343D8F
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580156; cv=none; b=mMg3CD3Ax55waHgLuouwCDvSEJNkOvv61gZRzgMnIdTvknKNx7ivV2iD7hcv2AlhtnCZr5v2Cl4HS6wSDaXMsP+3whsllwCqAM2Gsu6BhLJKloZ1PdA+stepPhkFtONq0NQPQIv2QrK9VExUZAfYkPyCo0rJmLfhT18BQXa6jRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580156; c=relaxed/simple;
	bh=xlmF2TedRlLX4pOlUC3j9NDW4clhMYuKzO5fDLT7nz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6RB/RD+qX2t4e+W9i6qMN8PDHcox8GZV2TMwOPOHqXECOuRUPBBmOBOUbqxLe22KSkmyH0fOhhMJ24hMwOW7ADT7boewKuSEtIqG7SlJjPLATZXzuYXHqLZGHBifZurN7Pxhq59u4H9+X1vzXS6c957WjCjAN8LmIiyaGQh8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMFBYS7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yc8ypkXE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMFBYS7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yc8ypkXE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GG4CKQ3192412
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZC3BgfWbRTghJiseDzpBiuOP
	0ljpxEF3ruRFm5DAwZw=; b=KMFBYS7Zm60h8n9YpoY9mm0TjKpVnxcgKgpXCqCT
	FsYxrl9QTvodKOS8RWWytXV6yfKNUnjf6V4KBfe9fiqPLJrd/FxfW32HtZzkBI3/
	TAXWPG0Kxw+bl76zNrfrFg7Wt8r80gOrZnD2F9uEShIbyRQ8BcJRwgIwnYbV7Xn+
	EzkGiLgV8cTTo4czGK4dvMJuzWOLioiT18VVpqrNU3UN60Un92Kfc+L+jjCqCOIV
	iWu74QDHGoQkO2nGB+BiWG/ddMTN8QIU94GFd4a1h03w/pSurF4StTYfIRs1U3KG
	qfXrd+lmWIH+KzKE2a9STtJAzkGdD+HYIccKKY8t0Uy2dw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968jtq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:15:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c530da0691so475147385a.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580151; x=1769184951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC3BgfWbRTghJiseDzpBiuOP0ljpxEF3ruRFm5DAwZw=;
        b=Yc8ypkXEsUNuJw0yj59bGWVyTp6yzVWnq9gxqtw4kNnbVPLZ7K/Hs8SvQpDCjismm/
         MKq25xtTNKjcZKrt4I1CK8sUeyoqxlFlkNz3rOkZbdqueGmlLKXgDxT7RHyZ1H9zDiJ8
         qFbS83SXlNzkRiLnPlrQzcMmrDvj5rFOLS6jtcPR03oWPo0xplJ98hAtM2rU8Ag4jPWv
         9kPP8ZUiTE3mfjFlaQFtn3FF55hNqQiTUITXHzZLi51tUSulEDPs/62unrEMWzikCJ/V
         +mYWYQQQsSH1KI4cQycMz8ar/e0/1kC6zy1vDNsKdKRe3qGYjF6W8hDNghFD6/UVSKDC
         HYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580151; x=1769184951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC3BgfWbRTghJiseDzpBiuOP0ljpxEF3ruRFm5DAwZw=;
        b=mK01o3Af5fWbkw5aUVVyp7h/yzzTSTx+gPhYtNsA04/ptAp+ShJCBDj6E7HHLW2vHH
         V9ucTcr7qYLBRNqZ5rfWEw+B9G3EetpjVv9ifm6LTM0GuAVLUZdy+327EyzeTNLGfLls
         feayY18cnCdEXjqW7/QlZVKCoVJlifGhvj22oKVdp6/vbG3JwLt/lBANWCvqkJxnqTfB
         I6dIi+mHmHofMZAFW4SaB2TfZV5NZzbkj+XNa4QrgPOfEOLk0QIT6vU6W61u4V7O9X/0
         ZnNZQuAQnDQh9QlkpxaA5UC/wZy54VP2zXuw9v1QlFrjL5IbS75zzpdaai64iawQM5nk
         PQNg==
X-Forwarded-Encrypted: i=1; AJvYcCX/H+S22wE2CyUdoCCfvDvjoeUlvt3NHMRS48ylk04wlUiOCPy7kOw5ldQiaoa597vQdgn2PPqMPRIIKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYCuVXySu+yJJcd5cAGZvWYiSH/Qk/ggF/dNXKn6l8PKukC1x8
	IzP1SKKKf8nF1uF6h8qI/FQQUZWmocv/XpCea3aFkKmWXEZnypn1Z7WTlx9vATbK4oAnG6y5YZX
	97m6BpgL1N0z3FMyNsiw+Hdg2+wUqV+xPumRm+oTtxEfFqHY7VQG79fJjKMsjFd+qrw==
X-Gm-Gg: AY/fxX4LG5nAdsdDE1JUmfydSwm0I8I0HORhxDQ2eI5s8uu2Q6d2UApTAdSImTlf8BY
	WHIhqmcnofFYZzn4mBt4Xvwl1zyQ8TNz2GwIbCP1f88AxmwIROlGWWrmRAXH5lB/agMB97wRclW
	BY2Foi6PH3eoYNvRXIK1cRYDFi6Wwo6M8QDVeYxThzKNdHzgtSg3Kn5JKISFZtafrGtVKc6YSGQ
	OAkwgm97V5wWTEoFvpz3PeAe7yDu/Q6PQTYVg5rjOICYllDFkYuo9I3HDXECbJa776FuaoUwmDj
	Cc3qhiXAZZC1/RMqFkPSqXFOYBaDon9p8OYIZkH6Tm44K4y5amMCnDNSMGWPZD3deyCil8489SK
	mWaQmUl9Je0lzWx2sg7pIiPgmIW1FkLt4A5qzsSTP5PBmzHFV/x3dAsQCiq3uOJ35YFbAmFndpi
	OtKFobV5kiYGFCfYgl9DCZHdY=
X-Received: by 2002:a05:620a:4729:b0:8b3:16c:1a79 with SMTP id af79cd13be357-8c6a693a95emr438683285a.53.1768580145913;
        Fri, 16 Jan 2026 08:15:45 -0800 (PST)
X-Received: by 2002:a05:620a:4729:b0:8b3:16c:1a79 with SMTP id af79cd13be357-8c6a693a95emr438660985a.53.1768580143933;
        Fri, 16 Jan 2026 08:15:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf351fcbsm908675e87.35.2026.01.16.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:15:43 -0800 (PST)
Date: Fri, 16 Jan 2026 18:15:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Message-ID: <nk6tdbjn7hpuxfypxgcfuzkbngwj6fsyzjjshfhwt2fmxy25l3@47k7b24jroy7>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696a6438 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=NEyQqhXCQXLKNWlO9YcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: u_atTB22VokTId2MrLc8Myie3z-O8Hqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfXw7QBuUQ7gqxG
 S6r+9xjw0Nu3qjBW2JZhJnooTgb+ZPrs9NsFuVGu1cZ/drvSwIp8RsI7bcAm1y5QvzUVzIu4fI7
 iDNc8Prjmx2hoQHq7xtn6EVD/ipOXy8XX6yIGBRpvDzlb0yrQFAAoICdqHkbqS+yioK7bqAB/dl
 58Oy16HA9b2r4aDeY/nlDBRFtoDozc4TKNrxRjMBR4YJDrIypb2dKY2GiZCPwSwv1cC66ARa9zc
 JnXfRHF0MbWB5dJhtHXAyHz1elNxhGh5KQoPMHxoDTlRbvLiONSM09tf9mafO74YehvoYntSK8r
 OgYx3Oi/e8JLNjGf5vZ+hIt9DPFcpv4DihFv6lp8jspKDgdGsIRImM4x5m0P8exVGi3QdTyCYhM
 3OnQeNTi1lc6sxX3vSiWs+V6R6Y3iiGJ6gk2R4W1H1lEvTWqhWakgndW6OcUwTj9qBrh3qgHLes
 +llvqdP4GYpyytaOiUw==
X-Proofpoint-GUID: u_atTB22VokTId2MrLc8Myie3z-O8Hqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:50PM +0100, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
