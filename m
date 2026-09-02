Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EAA40803B
	for <phone-devel@vger.kernel.org>; Wed,  2 Sep 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339709; cv=none; b=q5yc0SY/iYhIzI4BwGIfYL4qeVfyPjjVcebZI5UaxR/VN/F++XxlPzsKQe23aEDOQQbktAIhUxv8uh7jdx83UnK+iP3+/rTjtYwbIihLgNqh1rnQDMCuiZ4695eaObZCRBzSVm94enEKIqMlW38tln/BHaVS59/qvIJa4FuwdZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339709; c=relaxed/simple;
	bh=eB/Bh653xAWzA4PtfQ6Jt/DwbaWdTnThPhgF8M4tAvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua7C0wHJ39iW7gTCxVZkbxz8Lll7OpmyUjMjSI0zleDzP1J/cgCp4XfXOTzDlX6XaVOVkzIhTTBL5aMYwzxaJkN6ws0rEiHHjahONDPY1KmAwFI2jLAkcANAqKVxVK37ujP8YfpJtsKL0zZPGYMYN5pbyI511UdDfFMIkY5Oh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzuAVyeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+CQh26Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzuAVyeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+CQh26Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VnaX205166
	for <phone-devel@vger.kernel.org>; Wed, 2 Sep 2026 09:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bg7g3Rb4CxJ6KDsirvNiFlqw
	jHr1Y19jqJWdobxDWFc=; b=UzuAVyehZgQf6psj7mtIXh6yzPkgopoyRJJAXrdS
	ZXkOZ8QeVVcxUo91qKnBGLiELpvpjXvjIhgfeyDY6Jk7uYsjUEZW9fQCU3x5hitc
	WRwJPhTmXNyHcPQpkiZ3mNizsr+yls4bMPWPhQt7ubVA0RnZ7RGnmQ4/FI3Lmq4H
	dM/f+CWm9XEX3wW4X0h9Ycs24X2mgJ3mBOTIerRy3wFXoad/GyXXVHFymzMT+tik
	cI5ZNorHP2N4wq33sNsaIGU4HGLESfoODxleY5Hs6sLTw6BecVLxDR6bPwuh3dPN
	1fPLK41NNhssIrk87QRA38rgWY6u5PSn4rWr7+kW5nubCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbk4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 09:01:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939694871aaso15014385a.2
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339706; x=1788944506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bg7g3Rb4CxJ6KDsirvNiFlqwjHr1Y19jqJWdobxDWFc=;
        b=F+CQh26YXe5aLRPZm3g5GYnEj6YBLppI8ICLD4j6UfDYDokrj45RnmxY+1ugBgh1Cn
         7XGbGU3e7u2c0kyT0zjnCNFSVBxjdMTlggZfWYWkdqHUtc9H1KSRWR3Dig7YE6fB5YBO
         ExdJSdimttn+o4nuxQCswqgc3FD+Ez3W20KaWuT/RdpnViymCLMrre4nhAXXOIfJokJk
         nxYBDH3YnTq/KiXcycI4qPWlF4e95uNkTxFBponywr4H9USl+jvcE9+719XkwlM/x2/s
         xl7ZmBJh3fgr5aQ2DbCAeQ2YzljgTFk8mlIy7V1GBEDJHyjLfAAVnjaOJpo0BbiwLe0P
         vwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339706; x=1788944506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bg7g3Rb4CxJ6KDsirvNiFlqwjHr1Y19jqJWdobxDWFc=;
        b=lbAlO3vOSCYrQhiDgDi4HM8oxwI7FxOErFZ4DyD9XpR2HsJZnJTMFtF6dEPeYU0trm
         aT6EDe6zDCFfT71kAMIesKuShjpUs494I1XTdlbB/J2EkmeoPUZAqT0GI48eSy4IRV1u
         g/UQ5btGSYe4BYG3i0A4DEVegu+gz0zkmXT832nKu42Hj6KJRTxVirj2KSDqFYJNsy7W
         OjXLeinJGX+wTvJXf8dl1YQaA7M6SD0ami/BBwrDPcxZuHZRllg2ag2dziFwnJCJKc+x
         5HiIOWpqdkeI84o4ZwvaEOYdDobfziEHH6Lcm9pfK6J3j+KaDqee10HKo/ubJa1hfrwj
         Triw==
X-Forwarded-Encrypted: i=1; AHgh+RqvXr7I5C8hZK4hEireV7T90wAbp9gAnkijuSv7CWebLVPTzmH8s1yVw4XEEUkMrHutaCBv++GX+paAtA==@vger.kernel.org
X-Gm-Message-State: AFuF++n/07czxKy5NgBWN6ckLzxe+Zg+G3Iy14/y1H0SXrCiC8DDONUe
	wGyPcBHm5zh6Nar4oKAwAHgFZYIVf1Pg/IVqJaR7A5OBSxYfbO6PEhhIdZAwIgECyL67EIqX603
	VGg1UmogqVlwYwdAAtABPcMT8EH31O66YlpbkLQpLdjDQ0pyZIFjkqdKU4SQtoTZuVBlOCWX5cQ
	==
X-Gm-Gg: AR+sD11AM53Uz2o68nsYHRfMEefpXQTQcbht+FH8N/wlfKsPU1hqZ/jMClvM8M12Qfx
	mj/mPXAhsTMpwSZR0OC+ixmb2B87Wrv9ANdhJC3XC9Ysyb1v8Or0E+PfwuMMtIwGVQDy+Czl6NL
	0OhzaztFay3p/bSbVN+A0MyaAnIwLyFL7oE0OjAic7eBfjAUTes+G0wEPvGL9zV/5uDpKujGmsJ
	e+gCNvxBWBLMRKvoyv/UHwDI0gf/NZ3OvNWA0KLk48DjfzyDs7eOUDWjdCFqQHyxHYSA3mgomIY
	3cPL2sZYhaPAtQNzeSSQ0bqvPwYXnlEnHd/NvIlwg3+XSCUvOIxgNfMb0Zng2zHfmmXqMqjnA3R
	t0R5S2GxzJ4ENh6c=
X-Received: by 2002:a05:620a:17a8:b0:939:c45:80ea with SMTP id af79cd13be357-93960f86129mr358425085a.29.1788339701136;
        Wed, 02 Sep 2026 02:01:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:939:c45:80ea with SMTP id af79cd13be357-93960f86129mr358416285a.29.1788339700561;
        Wed, 02 Sep 2026 02:01:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea468sm5188150f8f.26.2026.09.02.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:39 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:38 +0300
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
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
Message-ID: <pbaoeou4eqcqmkz3bopkrzdcr63zb2pkg7hqw4yyg3yph3dztx@lathmqh3p54x>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97e5fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: NFZW0qSR5Yh67s8knGVfb3gp_lr7Snun
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX66ux7n7aBxML
 LZ4zMU+8meuoyA3u5uiYPH/klUDEX/qrRaJD1+YStszun/n/alx/OV2QCogfMLcKKdVqmU2y7iv
 34t7CLSWY+RwMD3le+QAQiFUZIY1mNE=
X-Proofpoint-ORIG-GUID: NFZW0qSR5Yh67s8knGVfb3gp_lr7Snun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX5d8ESiZ7RZdk
 Db1pLyYQ8HHILLCta9q/sKEIo7z4urPCplPdxb6CQoPHpFLSGw2ejvOnnMRskQHm58DEl7fdd+k
 GePI2yQPQIGChi6y88xNz03thAsJHCB4TItPIxg6vK8g+lBJkxxF4DHIJWtWKH4gyG6znnDW9me
 dtXYl/xX03gyoEd7z2SjeINp0GA3jJ2zWNtsZaQSJV5rQ/OonJiDLmuEwcklUgph3mDsILwQOeo
 M6nlG6pjsiRBnaPgeCvNA8mwmELXAq3oemW5IXQPhGygV/Z0JowTjLDTlhXz+OfUiQbPboLM7w7
 eYIBpE6sIwYbQLNsu2Tv71pEdVoRfomHoSvyLKRwk1i/NOsvZdLJV7r5SE0/jIgowYAt57AWUGw
 SjECHVbIOFDFLnOvpcSFlkwFAXVv1x5HCgWhZ50NS9AHMlpJPvjd4V0CjPTxBwRz0ZIUFiwuGiT
 o9hW5s2KO1XauuDhT4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020079

On 26-09-01 10:58:58, Luca Weiss wrote:
> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
> are not used from the rpmh regulator driver on SM6350, the regulators do
> exist, so add them with the types based on the datasheet.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
