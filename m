Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C082FD7D3
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528669; cv=none; b=V34Gy5pTvrgVHygADXiSz+NITXPfufVY/ARBst/hS/RozS+q2DMJaZnswHTbozmFwYQeBDn5BkK+vRIRpSNTY0Sg4Q7prRG04hJ2wTsogukRpjDNPA1Oj5mZFOhIFORT0OfUQB5T91eXYpP93forGcYJCbl4/DUTqSQRwbipo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528669; c=relaxed/simple;
	bh=UEnZF331CsgXJwwFeI3HufONJrEKbDvBmT7uOVLUG0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOoehln+qBRUbWX3PdIJHaDie2W34oIDUZXTs9Hjz0bFbQvt9fTOVIwaXP3D5/RIqwia+Qt+2Z6w7pK9p1NR2u1v1y1lJRt3yXC54CWbGLwH+KSzSj71arAVDqbyh5hrXR9dKxAWYTOs3IwfUYcDlC+7KGTmLYUybGzAWywrSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDmBt9WM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOZdOUid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDmBt9WM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOZdOUid"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4dcw1325946
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FYJXR7Vj/iJOr5VO40dA1IKT
	kKe0B9u9fRBgsMHKSoE=; b=LDmBt9WMbGw9sw/2KlRhymVsKj/mgG40TZDP/8NY
	5JVyk11bzWAjDzWlw9fa4odGrr3KJOVF1mPB2BZ9UO8+b6CBuIj3+N+UoVDYRklT
	A0HVZ75AlqcYJZlI9qyIfaVYwlIkLv758dyG6WUS0qgIfleTyao/3wi0hpZNguCM
	+oU2fUDQe2hpUeSEperQbnImKkcWh2TYVa1jveov17Uu5MdOt3QoDoehRmU+nHuz
	CSPjEPRxYusObVIut1hv2dk5acmkQtcsPmOQYkFiKyN+MAwtLWoijjnQ9tYz1otk
	Q6Oqkz7Zmzdlj+JRy9X1IupD/WLx3TiHXKp4pd/8W37K3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34h917u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:11:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so64294861cf.3
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776528666; x=1777133466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=EOZdOUidQGCgh5DgnMchCvQtGrdPSkuNUpXww+zp16KuSHZadF0nGpSUJRp3kemX8c
         vhNugLKLBUn6Sl6zhrCo1No1niQqJ3fopXI1hg93d+bCmLEEjIRcbDec5lCGJTPhQozA
         M/T85pPyC0rZurjdR/sqRc2JphQ+pyBNyPByetQ5KIZW0FejBYZrwQk/MvjPT4+Ba3xu
         VR5jlQjy62Vp8ibGxDk0qMOpKGXbLVXDwXg4mShIdxB09uP7NQjFmHbBukuIT90Jw/CN
         sxc/Rziu5S2qZ3tkM74jiQ9O4qmS5Jq770QGbmou6HSXxGMuq9FiIv7WMyHYUVFf6QVo
         mt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528666; x=1777133466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=qyhvswLjP0QTbeLEilapjsIo1FQdtP8dvjk9Gln6dYGfuTV99Q+D0/AYq6twVje38x
         atVis2delar3fEI0/RRxBXjca2mB3S0nL69+sSi4WxqhwRRt025acnrFYzP849tIy/R/
         7rF75l6tzaQ94ZzTFWkFP4xCSZ8Rv94fnYeqmmh3h3Q+7YtDgBJW2coL6z7SP8uqDpGA
         nnEc8nY1JdQpSIHShYXWzD8Y0vsC5HCFYRh8EYXfCogklivPNG0lMhMYggTgf9YoLX6G
         zYdkU+1eWnm9tUPIX8qYMJkj4bTgZ4+2qfn0etaY5s8efft454c631K8ZhX9cW7hBTfy
         7g4w==
X-Forwarded-Encrypted: i=1; AFNElJ/jinNsOz1HEHU/UjOwokQdDmkoJo08evyovjS7jHCYYa84q2JsxAosPWq+5mpsS074OpVn94doTHnLnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBefEeEoXYm/f86BIJALaMNMDtP1Cf5QKYnrnjxeWd+lGfpBDb
	gKv/kAKdrZ0/Kk/aCZoFs6pX349jd19fMHhq4TkM/Kr2yJQYny9YhDRz8609XtDG60uzEJEV/5t
	z2Aew6TqUflPsOc6uTeEK9mSGkLSMud5Xh5YK+Hb0xU/zGK8XylkgWsdoUOH9l0Sr7A==
X-Gm-Gg: AeBDiet7KyDZMv6OITzfc6RFPP7xl8hcszL6TUMQOjeefy6bYVqr5Od2r9Lrl01rEf3
	mW2jy1QlWrHIj3Miupq3Ft4j63kuQ63jeKJwsdi+FuPYdY3P5kW99EMECcqNIr0THbFbcwU3NES
	75LSZrZ6+eEqGOr47REqedYlFKmEaswIVVlZmP0ADNSYSPXTaAnxXb7fd7h2LDZq7CsA8EM6zeq
	JkcEE4EFFc3RwQIX+7GwZFfDr7u1kC1r5I24TM3COq1ILJILZfK4D0C8ezigzacfki6tInQq8Lp
	ej4BNZVu5EUFcfzl6i3jhDSzDhI30tatdS5Zj6X08ZHjK575Wa0hAwL00kz0+W+T4chuu59CEH5
	iwRRQzgnZo72drNCeeEncAOZgN5v2qHJwMXtNvbJ/EkdMXjWTzMP/sp613zNQlQExJNR7gGjqZb
	Fzep3AxXt137G5zDzsQQxMgutWWv1L03bErGnekK1iKNPcSA==
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235841cf.27.1776528665903;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235441cf.27.1776528665507;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c88adsm1464383e87.35.2026.04.18.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:11:04 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <rnpbdbjlpx6wemeuzsm33njmnihhli6mvjzhwu4m64vpgbxait@7pnk2rdt2djk>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
 <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e3ad1a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wxLWbCv9AAAA:8
 a=wPxmQtTReXDiQBvha_gA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: WRrvfQO1g7-ZSQVc2s8iHg8tyirZwGLT
X-Proofpoint-ORIG-GUID: WRrvfQO1g7-ZSQVc2s8iHg8tyirZwGLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2MSBTYWx0ZWRfX123DEEXiwxpu
 cEFH6B3Sq0rc+fBdYJO/RQwONAz6ubekT6mu8Mk5uxnTGInvS/+iiQCegMEX6FUYx5NESMEorMx
 +NEY8yB4G8Dc+SH9OG93Xmme7ouzXbHlaneo1DVivjNoPSgc2KgxBCwGttA6Gs3rkw85q35PfnU
 hC8WCJ2SrJbiWD1XVqJeVGX7qcuqPVcN+RI3aRIy+Tf48lUPbTSxnn3NFjD4SMKK1PQbDUe+n/H
 uzSaO01jDmoOCGLcd8HTK/rgGfJhFoMfqTN16Z1CLxsCGoFvDZKoPffiKMaPj/WSo15S9cKROKf
 tiySdjrgwwupjgr1heoJaW96X2zhfkDzfM+vvh1iVXZy7gVM9bGygLN/jJ5SmXW6wdcOxaIY8Qb
 zq5r7jzY8j7cuaBu/Yk+py/y5+fOBizIjyWMtB4k0Fw6/IjjbeJFEQ8TQo98rsh6P0GrhjizURw
 Kwn/HenPuXvFrsWcZrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180161

On Thu, Apr 16, 2026 at 03:49:33PM +0200, Konrad Dybcio wrote:
> On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> > On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
> >> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
> >>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> >>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> >>>>
> >>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
> >>>
> >>> This doesn't quite seem to be the case, some fields differ and
> >>> apq8064 additionally has:
> >>>
> >>> QCOM_RPM_PM8821_SMPS1
> >>> QCOM_RPM_PM8821_SMPS2
> >>> QCOM_RPM_PM8821_LDO1
> >>> QCOM_RPM_VDDMIN_GPIO
> >>
> >> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> > 
> > What I meant by "clock descriptor" in the commit message was
> > specifically the subset corresponding to RPM managed clocks. From what I
> > can tell based on downstream code, msm8960 and apq8064 seem to share the
> > same set of RPM clocks, even though the overall resource lists differ.
> > 
> > Is that understanding correct?
> 
> If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:
> 
> +MSM_RPM_MAP(PLL_4, PLL_4, 1),
> +MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),
> 
> While 8960 has:
> -MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

You are comparing 8x60 to 8960, while it should be 8960 to 8064.

I see that there are differences, but the QDSS is the same.

-- 
With best wishes
Dmitry
