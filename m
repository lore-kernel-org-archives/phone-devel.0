Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D22DC79A
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760645588; cv=none; b=QfHbGCme8jhdBCJw0q7g/nmvyxnLHHwzZoihTf+q8YmHu0QtTfU2UG62KZ4HHYVciujr96H3qxX1IpVrXyhtGfumfx/bHdgVrN9Wf+N19ic7o38/+2fEabJRG+ctg6Vl1qrCy/JWfXvAhvwy9cuzfXcXPKMbcz2adcs6JIq5vnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760645588; c=relaxed/simple;
	bh=mOME36+8eQcGxhH4dlB6qH+29/zcbf4zo8g9Kx3M6/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMGc3YAyZXuiGs3YgRVDJSuXub6cX0yE54sgdmb+ununsnqCL0qI2SQAOl4UmV6xILiLUFCYAhNM3FMQ3Rpg4Pz4dAI7+h75udY3+bMi0pRlZUEP3yKwnmjPBI0Jvo/T8ZuQdUJBPKYZpaiFcM4uxMlwD6JvPrGyYYvYzZyJ7Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJbWk0VY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJbWk0VY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GG2F4Q016979
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EZQrGx2m2xHUIxdtUEMN1cB9
	SbmMCf28CGDq/t4r4js=; b=IJbWk0VYTEllwTRWe8pLZBWqeFQZD5Hgo8gLf494
	nwsIHDZIG7vexKXz9+8KCJ6jGY8LvUXuvBt0nlFwE8q4nvDEOLS9DArAQ7K6Mkwc
	bbJ2t9ZpTQ5PHfLBNfn5sqOAig2K7T3+oADnIBkO8m3zdc5QHwurMMXd5Jucg8Wn
	vUlfiv9TXv46n9nI5G+nSO2SW6S8UDGgPT6MomcSMrFKVVDFs1KL0qKsVzbb7ibl
	ahlhTkSME3vKK5kZTuIW74+ZRXUOrOCChggm4z7bNbKR3w0cmUHqdtqhFmIWEEK3
	79sN/Z/55ePVXP+i9BkSj32yAiBKxIjK/ouIJJkYexJuyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkhkxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 20:13:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86df46fa013so510822685a.2
        for <phone-devel@vger.kernel.org>; Thu, 16 Oct 2025 13:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760645583; x=1761250383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZQrGx2m2xHUIxdtUEMN1cB9SbmMCf28CGDq/t4r4js=;
        b=RhCQY03QdPIEGMaGu37DTFV5zYfE8t/pRYFarY+sU+d9lYbXjCwAAEm4vDaNVvV6VY
         1TT9pcs7D2XggN8rnNfMzqCrpIxUvki7QvCDcaq4Kb+bn6oA7iQoY8w6bOhfTbjvazjK
         hiC3ykY/hp/xhWardnI+NQk8lr22mGa0Q2oyRq9wxLK5h3ME/y1nfliA3Bu7/jX/M54D
         82+aepEeQpCDFgRwiJK0A0ZgW3J1KlZgy8OzvYVt3Fkj75N6ArUD9/gfK22PJKQ165OQ
         4/9jQGdRntfHRZLelq9vTFAMxEgge5+kuzpokno9e7RIqv8a2yMUA/sadB6bgx7ksYej
         6bkA==
X-Forwarded-Encrypted: i=1; AJvYcCWwvGU3mjKNcmLkE3EJhUtYKePAHRpZ/JdPt/qXsjyIuQ08eTmr4tw1hzp9A4gZtHSyal/ET+PUtjn/VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjwmao/sE/DYo7Oy8Clr3BUpX0UPDTkJT+uSUL5apOQk8YVAev
	DWN5nfEuSfFBFAaZWJBSutwjF+VjqM+zdiheS8VcdabeNpQC5XeAjyAPCTfqSzpqqgXFkUpOsfi
	V7bkHLyMXEeYVCub1Oq0zJx5JIDJD1tlwUzNNaK6AqVMRuBu2bFlVelfe3Bg+PUDkIQ==
X-Gm-Gg: ASbGncvni2GJi9mOXatiBXb76A3Bg5kYzLtI1kO2Xk82KgG0uBo1VOmLxbXPzZxSjRb
	0lkab0NcRJbcKhFh/4eDkHI0mmlCkT2No3zjm+yhqoWH+wrMFerOquuYd36aAvInLkwR5jtGxhw
	jQv6+B6Cxd4RitXVmWlsl6Qn98o/H9GVeBnKORCZ0FHMDrabkxaG86T5jZsnihqi8MTqRNlvGHP
	tAQiyBY4OYSnDbQYBWYeeNsAh/aejJgsF1FtD31D+VVcgX3yAtjNSQcGZKsDq/nSHBT9BEYwfar
	L1j3jE7pU1x3acgRkLG2mems0iH68DG86eHpPTHee3pOffutLZkTkFzuE+q8CLw2opzPtRANJwU
	k8q7TMJqvGtqWsOVHtYwCMvsMt0z403DLftKnrwDH01M9Em3v1PKy69c8Oz+IvWgXqk/jVLghcc
	FY+K0IDpIznn0=
X-Received: by 2002:a05:622a:198e:b0:4c7:e39a:388b with SMTP id d75a77b69052e-4e89d357b64mr20224721cf.47.1760645583009;
        Thu, 16 Oct 2025 13:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNe0OiqXmb/bPK0O4iLCJSWLwLXN9liqFFAIqNAzYgpnDAi5RXwm5Sf4ucmJvR7g081xSpLQ==
X-Received: by 2002:a05:622a:198e:b0:4c7:e39a:388b with SMTP id d75a77b69052e-4e89d357b64mr20224331cf.47.1760645582578;
        Thu, 16 Oct 2025 13:13:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908856381dsm7280357e87.80.2025.10.16.13.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:13:00 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:12:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: sdm845-oneplus: Group panel
 pinctrl
Message-ID: <bspiap2gflponimgt64ulkuyp6sfpzab22bx2v27tdg7m6dynl@c7p7eay3h6r6>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-5-ce0f3566b903@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-5-ce0f3566b903@ixit.cz>
X-Proofpoint-ORIG-GUID: FG_LnPvGbatJK7nYKiXQbRdWPsRrd9e0
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f151cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=zJdh1BpShusDlwL3NFkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FG_LnPvGbatJK7nYKiXQbRdWPsRrd9e0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6XY2UZ4xmHa1
 IHEuUriZbXebIzJj88hwPwdFxpC9Q31OQz8xYERj8AIyWGMN3EiI9fTZZDvGSC5ZzKHtxDXbMzT
 de/ZiyxrEYohPE/F5eJ2UBFNsLIn/FOTgpfMOy9Lp2jRVl2DfboU++rYAyqfG2zd3H3BaJnInUH
 Sa5J3UFnf9PQSwSptOQTCKpBpffXcUyADD7uGTpBM0LMTL3bpR55qjIfme57IiAK7ob9UmLcsm4
 40VFIVeHdDxv4zyiF/r8vuhuSVntXw0KJwmYKY7RZ/9sS49JSsAV2ZW3LxMSvkJLk0pDA+Q0Zt8
 YxyiKZyf0YOPUG0XKzDiccYvCT/KsswJE9YnFBMyUeCOoBv8jcazBgkoogsRbZKqPPeiSeBmPjc
 KHDZ6/+edAcsSEVyuiBoIDclGQceuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Thu, Oct 16, 2025 at 06:17:00PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> As these pins won't be used outside the group, let's group them.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++-----------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
