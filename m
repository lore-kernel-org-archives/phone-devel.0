Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319F31E856
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246556; cv=none; b=jEzsOXp/6xjA1PnWdfyO78eY0CL5Vd3u2ymFIDC2rVWiLOH+WNA2uk1P6NK6RCbq8P9O+OmISAip5CfutBX9K660z8WQh7f1c2KiLLczb9SaZ48til3JnQj2EQc6c9unSiMLeLrXcFhjdgBW+wASh3eDO5SIf73cxXCQNSV92xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246556; c=relaxed/simple;
	bh=crMzeAvRDKSc+oYzWKMBeU0u1eHcNkl52DqLw8sUBNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmcQ9W6AVIBs+kgKgACii8Psc6NqfD9+lcbPDr2779hIeBcB8WP73l3hXoYvufGAkNc+4tG8gQcy1OlaS/CD2mJhHxqoSIam8GN+QaT5kEgDhtCJHEf1Z5RT8mysDlbCoczmPNJTYfd88z7ycGo0ut+l0pwk23TMikZnaU7f3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX62KU0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jETuYKUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX62KU0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jETuYKUc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EVMYR142249
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 20:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SBF5UL6FbQfto/4s8YknHPL
	hSX/uFdWPyfp8iHTzv0=; b=AX62KU0Sn6FDkeYtRGyaADed8cM90clzxYajwt99
	Hi6N7yFfwhWio5vGDSBjlfMMzMok1Kj6XFjezvhQb4VmWQTJY+3FMn230Noj92Ux
	M9DZkRh2cjWidCGlJzxwz0D/WqV1Qjiis/0czp/gxyH8mEV3SVux2hqLbNnFzjjf
	X4cV9S2ZD4ZQOiiphdbKfTNaL0YWzmahnmyYPCMfddobDqUac1jiWUeJQ+5A/maN
	OIKqP5CN40x2O0jwMIVJRd6KZQnNwrfUbwDCOSMs9stDfNeA4oNr7YvOq8TfiIOJ
	QfMCrbH++etGq91UlUynhfsU7hpnsWrVr2Hq+r3gxZ2Y7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y284d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 20:02:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9484dbd65a7so986205241.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246553; x=1775851353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=jETuYKUcx8YPZf2kpeevCrbpZ2X7WZu27r9PKyhV93FCkqFUqERh6mejjYhFKSgrvT
         TrQRjx5sjr8QWI0GAo2NsjBjA8AKZr7PaZih6LK5O3HEP4w17qeoH/5Joz+/VsoHS59Z
         uV2i7OAlcRVbr0pV+KJ2t4b9wr5JrZp+nwoMx/h2lpOFHG9Hww5F9fN9o3j5t02UaDEK
         uNOvG0xJgicPW0ryVTv39W3N20t625Ic6d5gQYLU4G3UBaun0tYeVS4LiCactDAS1MTb
         rQrdZ4BUewIIawSFX2PEuK3Vt3GmQpLYiw8R6/Zuk3lQg0CZkyHWiXjDlLDQmmHTuZRi
         MD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246553; x=1775851353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=JnJ/BLkevPYRlwh6fG2Y6nsG49j6+zJVinuBSepZ/gdqvQhSLDRsKdMWbW/6dJ+SNJ
         j3Ek5KqLgd3/PSZJwNomdQ3Fy0iQNDcreBfO9XfFlU8JBIdu8rmPsSX5j5pdPttVATE6
         NO7TbuFzyS8Q6Y/x1o5FaQyFnZj1y+w0yUD40l6mNDi8/TqGjI+dXRDpbk3Z/5AWPZwr
         l8YliJCtMR+5Thcvk5FxVhTdNLudhy2cgKHYiONkMRBlEajgZfffuLy5M154pEbwg89y
         bZzSYr/2wZeEdCx6v6qH5D9UHwayYnrPEQT9kaNdD8Amek6DSfTSVvy7zbbv4+WeTmys
         KRtg==
X-Forwarded-Encrypted: i=1; AJvYcCUA2VD34065lpPUmYd7dIqf7HJ78Z7g+8ZJTTWzLHSTRxfEW+pyOv1r6bp+sG6M5NH5M2KRgxBQ7RO9cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7oMZ10ySaJ+BZMidSfCkJz/ZsP2TVMw+MVk1XWLltWE+bjqFf
	C/xVzWPPrno0nxBIgYwP/gIv9Mx2Orj+EwoYjeZYkDBghIfcYHPTvAjtscALULm/09Gv0W2cCFu
	/N0OIba2UpL5GllqGfNNAkhEBmD0Ko9L0Yn0wsZB6Eu3AL0NoBkddZ1KGFHM/0iRAtw==
X-Gm-Gg: AeBDievxzLt/hwxuW+zLIGXVQQCSm9O/c2SFX9VxG6RdFP3pX6xtHNdFB+pMTn/qKiv
	Jm3vK6EkNcNzHJbdwDEa82S+Y/xvD9dJv3UR5v4ByfcVREmcPpXZuZpXbkJK+rsSw4vBkhRi66L
	T31LPicr/8UWezCDxb7fEbvIT0msPQ5EVRUaFiPLeNS0bD+VUfFAo2v56lzzDKGa7oyRK11NY+X
	lepq+7D6qTEWOX9XXmPt+l+Cnu44FZfAxEKGEs+ycGoBzbokTmZf0Su5QSU20/dT4RSDWCuYFyR
	pK+fY0h+qLbp6lJa62Sh6iEcNO86Oy3gyIWzfj+CmOm8CPznj5mZ97y9GVc387P8u8NXWMvp+B4
	apqT9rCm9/ajrcWx8r+b6Ai7BeEzMoh2E8J3H01FdNIJ5P2rgddA9sg+vNPRK40pXDLrLEaQ08y
	TUrDbb6Em/1iX1kJ/fyJRNI3bhjRkHvBxRUTs=
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1470005e0c.16.1775246553096;
        Fri, 03 Apr 2026 13:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1469977e0c.16.1775246552613;
        Fri, 03 Apr 2026 13:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6033sm1700350e87.48.2026.04.03.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:02:30 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:02:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Message-ID: <nxeer7565nk7mcyqucak7cetdgzsueqpvvy7hj52al6743qcox@yvyb5ixtnzpx>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
 <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d01cda cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: MayQOLlRqhFSD5iQJ0cXkx2Yp7kfH68Q
X-Proofpoint-GUID: MayQOLlRqhFSD5iQJ0cXkx2Yp7kfH68Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3OSBTYWx0ZWRfX1JL7XCL4ZHSB
 BycD8mxc5L3I9ldfzkmViTWlopm6UZvOkcbkE2B7/XffwoctEkvp8EqufcycpvrV7d6765azLWF
 baHK/O4daiK2TqvwWY+rft+65Imll3xupJGMWtkeptnxrbyHrGEBqhK5BVKdVKgj8dZorUpUSP8
 iACva+Qbx8te+Z8oxcRk2FnAnE4I9qsuTa/ELOdJ9PQhDylUdZ4GVq3/BOS0cBtylA/NcF8EC6e
 3n+sU/zfVxroojl0Ph5Nw61G8bQyZnofnCvuA6f33nLm/vuhoLlV2n1OR+cUGnkM2jTGGg83LgP
 h8hi1OpfUUZL1FyiyyiD/dmYKAbKiqKK3IK5SWf5/dPBIdAd8UCJNObh7S3MOGz135FAXcIhj/F
 jTp2kglf2j0DMVbIH9J5Uj86nBcbz2xsQRZsAH2Ynph3zmZF1BIEJneQ2HwD2xpvyXj/s48t3hn
 vK6jN0NJGxan/p6dgZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030179

On Fri, Apr 03, 2026 at 02:03:47PM +0200, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
