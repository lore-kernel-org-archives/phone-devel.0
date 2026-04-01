Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299921A9FA4
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050716; cv=none; b=M1nmf2LE+V0E9Gz5wtSn+Xwpn22dMxw/olzQEysO01nrz/zvwHGVvK5YMAkbWs9rP3rMDT8KbrwPaerogl8CNxJ8SyiQyKR8bU/odMD6jn7rnrJiL7Pi9zETv5zP8RQE0lterBKt+p/8gdzRLqXKgIlQ0vC0uAGRb581vDMXaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050716; c=relaxed/simple;
	bh=Vd5vDjCxhWyWtzd1Ee5ee+BsyeQgtwJekLtGxjYqD1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaQFQ3OVe/TO96kbeZ/yN3Mm9+mwFhMNSXReyYzxDuMRw7cBvBOqNCE8oxN+yiC9DYeMHFW2Kpbsx3CXUz/pdyQ0+pcdhpAioeu0Lph1hS9NFoyeNsY+drkSZXWbemPc2mWeZoZ5XZFx9a6QxKL8maaE8N58Klj49ZAdlbgrMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWCX1GRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gs4DolAB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWCX1GRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gs4DolAB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C6pDe1285829
	for <phone-devel@vger.kernel.org>; Wed, 1 Apr 2026 13:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mY+KZaKO/nHSQPzSP9lJCWN7
	OFJ4BSutV8s53MgEbSg=; b=lWCX1GRyqf2hYT1z75bdySnho2y6+VFAedsNHfqx
	ypROgq7k1ZD8ObFlqQnSwNxS53E3mMv5E9pS7iyW1KpCCfFYQRTfRdmEzpiAfOvS
	WcTxXWvoZUFyTFStS1ZRjgL4ariT2m3U7orRCRrNwlK+ROAEA7L+r/FFvE1QoJBh
	iG/5nWOqpYo68ZKSvlQzhZyes2mQRoMTTJKECgbqtwBwG4W00KjSvhzA+H7FiQZ0
	pY0m63a+O101vF81Lt8U+KThWAKtG2g6Tssn4flYUA929CXSVtH6MZ2hlzcTPEbW
	DAyU4Rcn51dXZC3daRvicNmHo0N1u5rYxBd6DF6QAiJwkw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3shsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 13:38:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so24952831cf.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050713; x=1775655513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mY+KZaKO/nHSQPzSP9lJCWN7OFJ4BSutV8s53MgEbSg=;
        b=gs4DolABKVMnRY90mPcz530Bwh73TZteteeU2JMfMWWozR/pox/8EmY22o9DC7ua54
         snRoPZJLgrR75m5i17DAyfJNjuygqRQTPzOnKgLo2T2GnTKpJ2Xtjp0R1Fy32LK+fwKy
         WKiFVnz2GfYYNnmWW8PSsfWO4znGEJhR71gvb/KPP/VYsmYL8fFjS2iQasmOPonAil/j
         cv0KoVE2A3vCGYBID/WjO3mNkP9IkSYXSokehFeYdhACeE4JD2+KPXiUU5LyK/VwCE9O
         dOct+T4hsAJrhkZzfWRw2Y2dPZPrXXLgqHAu4IRvXyJEOFvBLzZ8dOONIVEnyTwfNyW5
         qoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050713; x=1775655513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY+KZaKO/nHSQPzSP9lJCWN7OFJ4BSutV8s53MgEbSg=;
        b=a+at4q9nhAjklDtSNEDDz+9Ejcf8ud2Ll9xTCR6k1eamWoXiOvETRXbL3U7/4bmw3w
         R5W5UIZTMyuNjlrKjaENJS8CP6ow5Xw7NqSNLEJuRPmjq4L9KyRvpdlFayYyw/vfYP/9
         +TAfqISsQnNVY9sXTDpb1RYA6wTF2qwXklyWFDmfs5WDa38Xgz1Nz7DtDRyd3BszrGwb
         x7Td0FmqRrZvMGC1vaKcITRce5Jq/+NKowj/ueehA3RUEuHF1KH+MCYdDJmYe4y6Ej7a
         /ffrpz3UDIKCLV2Nerf9Oid2jufRLpqqcPWHQteG4Yf1g5RxWRusR+0qQI7nxNqfU6m8
         +QZA==
X-Forwarded-Encrypted: i=1; AJvYcCWpukhaps1Fgv2cx9i/o9Kh53DLio7nb5n1o5leg7jXM11tNaeSgsGA0fdBm4gOoT/q1a73OkJTvDDAJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgKSMIfv+Faa2B4P1rdlozuZpPVKOkS3gJ3Gl97uBWHhUnpB6
	wpYmjVKc8b7h3kXELfleveflFPQ9lMuJqJtli8QGPeCq7WLhiX+Z3thNL3+QYR61mYzriYpZkHV
	AsGAUHCSnyZbSNw3N0gVbHshTgXrIihVegu/x1f/SFBEzEiU3bUEdz5KDU6ANvORhPw==
X-Gm-Gg: ATEYQzz9Gqi5RApBgnSOyhnGZFnd9YWHoqVQU66PGUX8yO8QD6GVojYejvDit1aRJf6
	oLEWkhYPlTN8Ek/x6KLTMV7a8W8CO8fsglO5HQy1SKEJeLsHEzn5eGXDJCPpw0+D3JVzKXC09Yn
	srR4p3S38SYlFSnR7pckkV36omYe8YDrWi/C6N9OfCT+b+zNgbJBqfHqgYD6FOhBvcSwuBzRWVQ
	ctXqUllnYXkHwhTFvRZKX15yjcGt8tBK5Yz6Y/CPlGPuX8OOTG9h0NxqrtpHx7poYPc9cSfu9oT
	ym73dUkHE4sYRNGid8RodRfToPO3lcw3kCLeEz7sqbx5aTuOvPY6QN2sBQstU8qTq0jMDbLOovS
	6byVZrV2nx0cKhN/UHAR8oepWGQD62Ga4m+LT2g6gKbjzu6BPJY85Sphm6e8RP3LtvAY4MmyV4A
	5Sg6FqGylepy4jKDTBWG6ItavwFdfIXQtH2DU=
X-Received: by 2002:a05:622a:8c0b:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50d2c8ae8d9mr86225201cf.24.1775050713302;
        Wed, 01 Apr 2026 06:38:33 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0b:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50d2c8ae8d9mr86224781cf.24.1775050712776;
        Wed, 01 Apr 2026 06:38:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f25sm29362331fa.9.2026.04.01.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:38:31 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:38:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 14/15] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self', add memory-region
Message-ID: <vygzhy45djrxg6z66nin7grwmj2ihwymm6tyezv35ow2cupdos@7ybc4ktuma7g>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-14-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-14-fbbc4b7cc557@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd1fd9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=inTf1xXadgHeHM0vA7oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: Ll3fDnjAxumW2c09i3pgtsO-zz38LCod
X-Proofpoint-GUID: Ll3fDnjAxumW2c09i3pgtsO-zz38LCod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfX5Nb8No+Zz+KT
 tno3yHm2ErPHgeC5boUF+yULtu5NJ4SWmvGuZylsX7GHK+4TmiwkUClsZS1ktTUP9b2JnW5emQt
 XKNCQntJlEXOFqj+evnWETRarX2XNTrZhtSebpad2yELbfM/8NrLPqYRi53y7figFNFbDY+Ea8q
 OSEUcTN4mpBbxfJ2JLrtrbkdlA6eyEoA6KqxqDcA2bJEiqL/SlebK95u0bqq7VzRg0OxKPfTIUC
 3TRIGlQY1RacCFl6Hq0VRts51vltp/1TaWUwQTCzp1r2AkMOeQGlvBBbg1l+v/dMLpcQSX4D37a
 qOrEqIOrvU2e/J/WZFCXQAeC4vi0gGTd+e9KEH+0x0OkYPqNMTwWcPRXrrormYfCAQjAgl231SJ
 hwO6echmEIreUR1z8fhfRh9MConASbh/oX200LPhM7HDT98/yH8Iz+dVOagIU6Vo/vi7wOTNEQh
 LfC3HkdzfdOg9ViCQKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126

On Tue, Mar 31, 2026 at 08:22:48PM -0700, Paul Sajna wrote:
> The modem firmware for this device doesn't preload the IPA firmware
> and requires the OS handles that instead. Set qcom,gsi-loader = "self"
> to reflect that.
> 
> Ensure the ipa uses the correct memory.
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
