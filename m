Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9425A338
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528584; cv=none; b=QK8NcceOC28/Sy8QAKHbBBwxuOi6Y6GN4d4U6mNvmBc/4/ObKvfMlFJU+kRHcqSg8mnSWDGUHEKxEaotVonsiPmYDQi/e2JhnJiFhMrMpYLG53zgpIw05s3nSK0z+M2PaFU0yBYCLOubC2eyX/YXpUmXTgbI0G2Fwr3Io7BkZ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528584; c=relaxed/simple;
	bh=nfvlN7UkEb0nKtNa+S+QZmXeylN1f1PtuROfmyWs9K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5Ytr29EjyggkOQGKTcg5HbqIfuDOtGGtY+cJn7dyzFpQLbVXjtoLiX443UoGve4IDTz7IikzxbyQeW7a0FVlVV1ZiRR7agLAiI5ALucitiUPw7xao5LOdmeIz8U1IZiGMYhye6VvdCuPoaynEwvEfKFA5/mihzjLchXz9NGFzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPj43sYu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPj43sYu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AFtTM000949
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VZ6THAdlV/2oZwMcMAMqnt7w
	sTsjumTkUR0dkz23Wf4=; b=CPj43sYul8guz+t4yr+JQFycvTuXMbn4d+gOcKDP
	5eGOfSe4ZzhX7rnR9G+d0tz5TP82DfkcieYpkytkmcIDX4MZi48C9v1xOKjdXD4P
	lEBEyD2Gd/WFwyeytUu7/lbCoYs9LIPciQOlpiWdT2a26xqHzDu2sUYoIwM36tYP
	tmnjLdzW3EjB43AUmXzVryCYavzIdfznH3SzNPzfTDMoA0yAQaXSdK/+2vI4zdTF
	puru2U12/gIuLy2lpMdlXJlXjonYQsDiKVGbiNLb+ax4DH/agEPbMN9atAkZ/kl/
	dkm8qisHuCz/51HBOooL+XTlObWlNVyUjQ2dlrm5kqXgXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x646fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:56:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e5739a388bso52559781cf.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528579; x=1760133379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ6THAdlV/2oZwMcMAMqnt7wsTsjumTkUR0dkz23Wf4=;
        b=q9cLcz5QeHWKNH0qI9YBzDFLwUMRODuvQPZEs9fXPvo3jEDuzSj5t85KnaJHU/AM7+
         YBXCvQLQpnYwBVp/8qeLQpv0/H658sscb0IVfOqB17nFl0yAW3Ix+UsMryGZCZ8hMUX+
         9Dq27PPJPca1/leTjoqVBadN99v/taENVelI8Sl1Lo5xWq6HsWiIdLu62vP4ResSI4yA
         vgyvEVpXdgwcgSdMk1OVkkLcM1JBjQeFWOK+m8Vr+jw7AK2P0ojZJMNBRb1I8jCASwzr
         YI5ylDYKjscJpRElxJ+FTkuaRlr3GiykwwrTu4D30ky8gOrpl51F8sMJ0t6lRE+MNUvk
         ONJw==
X-Forwarded-Encrypted: i=1; AJvYcCVrtDMoieRuuaanj9UJ2smfSDV3ZZ8iJgE/t5NWmHRiCFw3BOjbYhVaI+zKBVdIrJGwv91zg7f6K2PVnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAIvYrI2t7XhXZiOeVvkC9J55XA8WPoOIEG88o1066LMM8U9U
	yo55D8gg6t5880JmI/cexRFrq1N/fSpkqtZtYHqk8or9lxngbQhxB2zskiH41mYBAQFC5N5FVoN
	0hM+jqb/AW1w60yQXQ1bfL20hPTAHp04dx13WJlARG4UKLkFKfVqT8JKv0O6gf2Lf3Q==
X-Gm-Gg: ASbGnctTxh6ZcmFAXRrdqXQTrnxx+fbWF0aUTG7g1Nm9QGD/GZDOYFC/zwBlV3o/CaB
	RmPrisTIFjUotdaAo3q25tVZUqEXQeKsCRjc0FFvAA0vhxIeBc50NTFmElMxH0DfIseFjzEMoU9
	VNy8wtZuu1r/2W2TXKMTvYtF5vRXszxPtSL3aijSTJXFfPOxmU4vn2DplLtTMhGX5I5EuLI66bY
	sHxXu/YuHhMNrCL3vnWe1Z5C4eJbJOX1Iz5XagMmNvrF9SZN3QyQR22C5UYMGclRPGVEOOMrofI
	L4JX3a57YRp/ifrPEzzABQflT0+js51eRPh+49Ow/bGU2mUZ5LWVc0jvlkUQHS+nGMIJDAVhAdB
	bNqYMOqcGwL0xhnmow1EhsXbm6ghUuzaFIK/ByK1zQhvy1aV38f5dQZot0A==
X-Received: by 2002:a05:622a:1113:b0:4b6:299d:dfe4 with SMTP id d75a77b69052e-4e576a7eb77mr62757411cf.32.1759528579521;
        Fri, 03 Oct 2025 14:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEV+3BdKX0PD5OIi5Zi3YgLxtsWp/Gk+LWDDE0zSja28BemaejJGH9owPkl1jZO6iNfl6UQg==
X-Received: by 2002:a05:622a:1113:b0:4b6:299d:dfe4 with SMTP id d75a77b69052e-4e576a7eb77mr62757221cf.32.1759528579043;
        Fri, 03 Oct 2025 14:56:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118e04asm2179885e87.64.2025.10.03.14.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:56:17 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:56:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
Message-ID: <g3p6yi32y532tf4luuzew55s2qjrlozqyggm22sog26oacskdw@fovj54wqxyan>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: khZhlYcI0Qqc2Xbr7cUMlwLon1Pub0kO
X-Proofpoint-ORIG-GUID: khZhlYcI0Qqc2Xbr7cUMlwLon1Pub0kO
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68e04684 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=v8E5xubLk08JJH_buREA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX4SRTNGrKx5cM
 d+N96b9sPJA3gczmjTJxGtm8oWnswvcQwUh9Olwbw3NvPsMEtcipsloOkyiyCWnROvS2XvbOXfX
 NUOPvuMhOap30LEWacCaLmFfNcn/JY1RqdG/WujvFfGODtb/Gxy2R/TYHDIy7Sz3qTRFv7Fpw5z
 oZsnxp/5eKvgh68cFeEU6hzkiPTZGBMSjlRwfxYB218+NQ7rHaOGzUeJeJlVzf389sfUhI/wYbp
 qaG7isbF/Qgn8KOzqprh06LB/QxEmPKZevAR3acn0pTcM6Iain+1GXXF2zMLrbsXCt9lsjO1Eto
 70q1krk5iXyFRWZeVwnDQyC2grQ7/3+EpTuIHTt5yDuLpmwrM3W60K3n3sn77rjTXi3Y05Ns018
 DxBl5p9TA5K8QXEeb8DZrd2PPPwBvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Sun, Sep 28, 2025 at 10:05:34PM -0700, Paul Sajna wrote:
> This lets modem get a bit closer to working
> 
> [   15.885735] ipa 1e40000.ipa: channel 4 limited to 256 TREs
> [   15.888550] ipa 1e40000.ipa: IPA driver initialized
> [   21.038968] ipa 1e40000.ipa: received modem starting event
> [   23.097401] ipa 1e40000.ipa: received modem running event
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index f309e6ebc075a691c7a522238b4a93ba9e63f3c0..898f87818d3d4d028cc762d7ffdf33b3c2352c92 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -484,7 +484,7 @@ zap-shader {
>  };
>  
>  &ipa {
> -	qcom,gsi-loader = "modem";
> +	qcom,gsi-loader = "self";

The commit message might need to be improved. The patch itself LGTM.

>  	memory-region = <&ipa_fw_mem>;
>  
>  	status = "okay";
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
