Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351E4078FE
	for <phone-devel@vger.kernel.org>; Wed,  2 Sep 2026 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339686; cv=none; b=iH7YCR58qnsg7YLO42E8pBCr2mkDRt0duSPwUjtVfx3aVa0hoc+S5aOtou1kHxIoBJY9qMW9nJ9FQoQAU/km7mzZZgjJIu13sbeMYum3krFQhIfrITNY9gDvQpAw36R21hliycRe38W7DjoGXuC9C5DNf2gZVhj34kjVJfjzdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339686; c=relaxed/simple;
	bh=Atq4pB3YGZ4lFAEE0+lnM2Mik4PShDbyqyPa7jARmoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQp1R013K67yb9XqgJozvqngroRmD7G4OI1/G6zhmWGgNJUHb2JN97L5i++KlKal5FKPbUVOo9z6MLWFaU1kzxG1b68InLdyvN4ldYZ+i5CuKFwNzGELBIG1mS8YeuU+/IM79P0G6jXmY8I8pcHHtF3rNH9i1CmVQ/lf5bAAebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0CDjcU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiJNI+Ai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0CDjcU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiJNI+Ai"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VkbD3758927
	for <phone-devel@vger.kernel.org>; Wed, 2 Sep 2026 09:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQbyCK8hb1C0dq/eCYljQc9X
	nj9duFCu694HFTDiHCc=; b=G0CDjcU0Z33uC/+1pPkUPpTkEdsh6cwkhIIBDNuG
	m5bnV9QrSeZxZM7sO0qUxMrZ5mwBp3IlzLTyttKxaW3xa9aYCD3PmoNLEtziQPh3
	BEgDf3lwo5HG8kNtSiT6VXudYGieSg8GURzkWnrPaJu7P9EI8AigTdUf/ViUDeG/
	WZLdSBjlEg8rLS78DWPLsb4jPJAkkSlic5ld2IFdaVtH4WuvDNDj2v18DxwaGVfn
	wMx8+/Xqj1HxCV/io9qcG32g9ZCkdV1mhWuwDnqcGqodXUTfLrTeA+64UItad1g0
	lptcR9pbVPxbnoaYgnPyZnYnjNSLB6JAh+Kd2fmItWrPZw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ck1bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 09:01:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so151590885a.1
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339683; x=1788944483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=OiJNI+Ai5Z9S8qvx3qx8fgXJOwxj70n/5yEPjrU3GOxn0Tl6/wWR7x82lfY6t60rvh
         stSsWTo+4WQ4dkW7A7+jrQSV45hvyZWc8tVnAA53a+FBHc3CQcFnEho3MI6DZ+IUuY9H
         YFoVoFl+/a9DFDd08sp59x99buLFZKKzqM75gpOs2okhEJi/MHfyHeJGtLYE0klXK5ZO
         1cCWt/JpM097feGuo4rfU3Hm4rGQYbHpFpIKnP8ysJDX63tQtRaT2QCfbPmXXb/Io/qI
         LMINZiIzTMDYOUKeh+Ose8eP69qAotG8ecPb9Jxpcseh/N13HK/cr1QNb+w8VTBH08JP
         NqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339683; x=1788944483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQbyCK8hb1C0dq/eCYljQc9Xnj9duFCu694HFTDiHCc=;
        b=eKqombZY8giJPHjP/+E9SKVsdE6CzwfbDuLQfYKWVO0PaZfXxHBsW5IFrYcItPi/8U
         5eiDjPgWsmZ897nem9pggSx6pFjLqzhUavWFZ/bpkAzROAERaaFWkX3L0IxLNlWk21Z6
         PfSh0MDcowW4RS2EbacjyNXnJdp98M5KlBoUMEfhLAiN3S2wCG/MffLapCX50ycegpTN
         Vnm8ByxSarqgdcLLmtQFihSPJFClHhdnLQvH62nC9gwdoUgpp12ReQLC8HYzltQoqzI/
         FKrTkP79LVe51BBgK74R4tSylrhx/Z3ujTQrlnob8fjbT4lXYGZv5i4chgDzex7H+t6T
         G69w==
X-Forwarded-Encrypted: i=1; AHgh+Ro8RZoOCyiVLqgfk6gCiWnRDzfoFaMXCgOaXbEc2EdQQMbwVphSYRZBYM7o6bQ51aogzEUqG1LUGlQqVw==@vger.kernel.org
X-Gm-Message-State: AFuF++kAoXfT8XB+sERhNaOJ42iiiJfJTl8rnjjo53ESWIHRtVM5OUKv
	7SlpGQi8m0HWUa6SR3Q4YtI6tVtUl7E/qtzkU9TsjgQcfuO2G3IV6hsFHsR5tTp2ohoSXwquUoP
	773RLAWSPi2RWq3ZGzdY1WRQTflfiVSbGDrQMHrjeosfx254j6kNKx4Ztm/d6O9LiNA==
X-Gm-Gg: AR+sD10Jepi3RyuJ9YMf1uCiorzca4QtvZeVUJfvQF+6sqeQJSk24BPpa7qrorRG+3L
	bw1CzGf6HF9szVIK5ShbnxP4Dx/sGgfjvjPyiTxgPjzI7YXUyG1ihl28r8c4GeaKcRvO7LEuknP
	YsDsf6IeGbq7EzLX0xxpH+l7YbAvUfsBqUz2mupYHPJ6OtVBVrGCp5Yw4+ytjQQQcYO+i936Dnu
	X0lFEquJiV0QS6k0niDHSIOiah7DESghvlSU62Jz4DRPvKNwY1rtd5xQD+fvjYjhjntpmtUJecw
	VtbJd7zJdm5FHYzXqAFXX58LpbWp0ratsNUg/OtYPOb2ddgZVff5gkvq0IzAun5WeRrV8Cvw9rN
	lYse1JiOlx3A4OQ==
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141499685a.9.1788339678440;
        Wed, 02 Sep 2026 02:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:4bee:f84b with SMTP id af79cd13be357-93965a10813mr141490185a.9.1788339677868;
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm155172055e9.15.2026.09.02.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:17 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] regulator: qcom-rpmh: Add supply names for PM6350
Message-ID: <yhbjhnmuwwqqbjlhpo4ppwtmehxnkiuqagzigf2nieqxqpiako@c4tfpqbizd2w>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-2-68288ab70aee@fairphone.com>
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97e5e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=siMggkYB9rnzUccrDQUA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: c2U4zTr8zO3_1GMRmujMuPAUJbzrJ1Ng
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfXxmPVtzxJWsZY
 PubINGe7rOBm/zaK7jmlqN8Q6dhjMdDjlGi8+h++v8WagtBsPtx1B9/xFLRNIOJjBubxa3XvP7r
 nk1TpKEeg/nr8OHS+e0x7j12nS3eMp4=
X-Proofpoint-GUID: c2U4zTr8zO3_1GMRmujMuPAUJbzrJ1Ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX0Z/C9tBvDCqS
 ToecA1OwLriNjigZrJ0Xvo52AKPy5NbmRWXXM1CdWby8poOW9Iyvge+T4Dy5D+Zk5xmvDx8ktBd
 uiTB4geKYmsiVaXx9I/zEdc/96ogKK0K1hvP9iuoPT+WM3picfYgi2wFOkKwzMebI7THUw9EiO/
 WMrjog2Pj66WFPzdmfq1uM2vXghh9iBWXNe+t40bLLovAFdpR1NPBUeL5aoV6BmVDea+ig8+Tw+
 Sycskz8bCDZvvY+87kXegvH05OnItB7pUlMNAUG+BdXkHi2PKCfEdNfJWo7zTO7g5WeihoT43Eg
 rZbjCO3vzeZes25lyENV2bTwlqceRH9ia5N9afCTJI6iz7Wq0KjE1WPC5z3RFjnQqL1XZjcBCTH
 A5cEwG9pdbb3bfUf9e1GZR/Yx709bo2YdMTrQ6fRcjn3lcsqCo0WEwtkYDAqZzyaWPUnbrBwzUQ
 WykxPLWMC7//JhP3qBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020079

On 26-09-01 10:58:57, Luca Weiss wrote:
> The supply names for the PM6350 regulators were skipped during initial
> bringup. Add them.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
