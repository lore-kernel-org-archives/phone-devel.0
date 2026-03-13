Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9783CB2E0
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422329; cv=none; b=DXCtW4qtSSOLLwtGZNcLA9hqBJldkZ6fg/LDgoP7PsOMZ0lFU6uepVUsUr0A9W766ncOydUbtgsyBd+f6F8LIOORVPuJZjUNZcWc06AOE3KxmwzhmkHsifzurCELGhnzncjDOQLy5teXtBBRR69NvmG35RV9UUMvDjdDNLQAJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422329; c=relaxed/simple;
	bh=7bvPpOlo3Hnsd5JwuRJwuLjMVqJ7gchQWap9fGysDtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFs6cl++5mC7feNgzj9s2dwrwGGa48Gx6Sx1vX4vdJA2zo7z1OmBL6UVgtBAMLAZGOZgq3cxSEP6gPLB5LSXgpCRc5JZ3ET2Z9VIpikryLse5hmLTMHzdXJiCqw2nnCrzbP1aZHpxAeTWQT0i2JYv90obTDz+AdNSaTg1TW7Qbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+5pucW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmDkCA69; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+5pucW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmDkCA69"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA85Yq1749468
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 17:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tKYh//pluaHllMvZiLoXWUrU
	wmatDhGiwXWuaVJJBw0=; b=Y+5pucW172gtZadTDwX8j0ocOPwk8tDzb+NrgSuV
	3LuqtjXmOX7NqRc3OANwSndO1eez5JNeA0+wLyUEIfqk2buet0qA2WhKgtYNQ0P7
	tNfyyw0VVRydsyr17nIFG2g5jrlHbTn6mYURvOrIkd2UUZzpZQN6N6xkH8uc8k8p
	fdcpx8F0B1du2nC9XB41tgvtXAaigl7Jk01TAdb2TV8n66NUOysMS5wUtFg1BNcy
	jwQSUlRqntLWcIETPWG7MrPThfDfqMod9yjEglwjTLYTef7Jx9JRJeMpM1MrtvZN
	BVekx/xxVfEheadlwT/svf2vbxGWH5e7y+7Rtk4HSlT3IA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6hdk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 17:18:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffbf6d209aso17188737137.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422327; x=1774027127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKYh//pluaHllMvZiLoXWUrUwmatDhGiwXWuaVJJBw0=;
        b=JmDkCA69+gFK2QNI0x0AWMahWbvHJsyvutmdpX/8hGphX+fxfDamI69XWuNAmfq45n
         VcRhYcHNGgD80Iobv/lMtNJHxc4DDJrb+FiRKLKliNfsV0jf9jQYYz6hDIv8SDnOk+f3
         P0Cr7F7HH2hLAuGeRddszRGbTxfMNdK0yhh53tiGbsS08JTBfxaFHT5G1pyk0JwpmUw6
         av5d9682k+pt/EDCkXRfqt+9FmVrh0XU/KxhdCDMeY9K5U1xT5g3Mujl2sloxuwTR+B/
         +Q/CoYB+APAPZexbQiuTsLN98xqSB8GdaWjxEWFi0spBLIsIVLUvJaMtdnYZrP0add9l
         L/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422327; x=1774027127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKYh//pluaHllMvZiLoXWUrUwmatDhGiwXWuaVJJBw0=;
        b=DRE6lDVFL+bgtdxO1ZwJfOXAZzHpRbNKmc0RHFWwDOnKtDIOCL4dWeUSkzteCFg5UF
         BRksKQoWJjS9WCc3Sk8iQyoex0gwPIodey+WdmJEZblEQRlDi9B1wArZJcCB4F3F/rA8
         f/YNCYtQditsPlM3CPmzMRIl8gnjP+80YUjAkKIRCfwNyBxWPx4v3E6WSMYwU5KT7HgQ
         mafvLOEn3Tr4VvK2oPdAOq62dJlIRVloOdTc3VOw2wsnJSlZ6Y3oqia7HvVLplRZFGDD
         y+zLoHbl1Mnc8/q/gUuvP7rt8kW/QOoobCWGQLJfqYQm1HROu/50AS7ZHwcnt9jFiZ7A
         ybPw==
X-Forwarded-Encrypted: i=1; AJvYcCXOkDnU7Gq3fEL0JLx3OsFnJbRfjyga9idPZ1/55bbEMW8IkpqNHE9+tp+Qnzp0w0eKW1ordaN9nSZwNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nJTQMtc09MQiPs5KXNYpSkoZNa4v385sko21g/jwkAfoTG67
	oqSW4PBL48atYKQt97eLt1+ogzI8Aa76PBQqMTmAljYDIZyqXjWGGEAOwBnJutyL1kfVFrWZgNc
	NEtIZQ2Sc5svdPdTt12FNR1bIwE447RDjCeXOyrC5umz2gtJRvGwsJbXyyk1B/zgfIw==
X-Gm-Gg: ATEYQzwC4OZuGwfhgjHNf93LGp6I1fkEQmeZ/pEIE74tijLmjO/EwygqZh8gAdcaL35
	qtTfAjuo1CBSRkm/Mg2T12V9ZiKsDYD1s4/iSKR79avUVhuPunQ1i4SrLR8fAD9VCYIEuu6YP/u
	jZmTPxC0Nlg9lwphBgp2TnUqTy24jGRoQLuLZ1bCaC2cJs3/bbBfcAtHrM76ayejOcfU9Qo78mL
	bx25dvmSlBHz+uTAXwpEtSUYSZAtpdwBiRyxCJTUQQA0xOczhl3Sp1LMmW0U6nGRsBme07835B6
	CbryrOkZz03PkJce0uJXCyS2CxXNUWfZbfUs0WapxuIBrsUEVEFAQGQnptaVZRKRlXZwDRmLsog
	NXM6R+Y5R9SKiuo9KwsZUnDPsRhK1y2fA0p3JdIrZux+Pz+8BtyA9F/lIpPsn0+hwZ705Hk/y8N
	MVhB9YbXfVmReA181nsv/hBlhaxx8EOqGwtTo=
X-Received: by 2002:a05:6102:5488:b0:5f5:5c2e:59ba with SMTP id ada2fe7eead31-6020e93d747mr2038734137.33.1773422326897;
        Fri, 13 Mar 2026 10:18:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:5f5:5c2e:59ba with SMTP id ada2fe7eead31-6020e93d747mr2038723137.33.1773422326483;
        Fri, 13 Mar 2026 10:18:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e67b73sm16445161fa.30.2026.03.13.10.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:18:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:18:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable S5KJN1 camera sensor
Message-ID: <xq7p4vftr2dhu3lzgjcadond4d47ayzd2jxqnyhq6eozziymbk@walmc2hsxrl7>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
 <20260313-fp5-s5kjn1-v1-3-fa4f1c727318@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-fp5-s5kjn1-v1-3-fa4f1c727318@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfX0JzXWOszkpEU
 FBkaUDzu7cHjbe9D0VdfjvbSteHgZ1LET+xf1SfqphcEQbOJmFeOHJx6xWnRgqai1PunaARTQSe
 KCPzCCZlmUE8NIIqILmyw1QucoB9+FPRGCpB+BCs8LMhUShFeyQbY8ouiv9ErhfHU9otA1QttG6
 7lIKBhmLfqUjNHVAtMt3wlxdducX3mm8cZPG9MleRxH4WxTvQBIsUNqqn9NXPWb/ycLJZKt6ocT
 v+I44Osz7pTx3G8wXqMOPY1ws8s9giAVcN8o0H0jSP0hJlAfiWFTTemxFYzZ2bcW5ZKSqtIed2Y
 Rq7NfM6M4oB1FimOUvFNUYTA2hPA3Yj8I1vEpgKGZmR2RLvwGzsrE7zQlNCrR16js+tNfG8ARCO
 ppIRRbCPhTqMNU6t905IhpPiQDLroTEJnxcCcQuK7soY6/ZY+q57zeGBnhL3Ap4VK89C2992ZC5
 t//pFihihUK8Fb8dkIg==
X-Proofpoint-GUID: eEY4bFhLH8i5WbaipOxHaUL38U8WPzfs
X-Proofpoint-ORIG-GUID: eEY4bFhLH8i5WbaipOxHaUL38U8WPzfs
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b446f7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qpRG9-ounqMPCAi8cIoA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138

On Fri, Mar 13, 2026 at 05:00:40PM +0100, Luca Weiss wrote:
> Enable the S5KJN1 driver which is used for the front camera on the
> Fairphone 5 smartphone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
