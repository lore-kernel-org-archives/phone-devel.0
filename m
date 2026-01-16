Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8974D337B81
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580273; cv=none; b=H9d1CxcprKNA1i5NCZCKtFlvfVmtdsUUkn5R1lLmVC1Wswa/lfvNgoTqWCDVxL62EJge8r+0dPb+g0jd021c2RMjQ6bb1EIzqHprAgIMViHIbGQt5YCIlpMDBQEnYvGqHXMfHKNgpDIcG6pNy/gb3SotRf7Kgr6HakAvrt0b03E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580273; c=relaxed/simple;
	bh=t4DdEKOjKr5dZLG+sJfzEP6TLG4Y4Vq9SxKsjXOGJgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRwpTtA7jjvdbrJx8oHXMAM0K8bixk2QXaDa+2bNTXV+jWt/0Zo/LmtCuwOWKADdA7S4BxLRdVD05GfbAXNeoiWttsxFDjitYxdQCyGVQuWOBC9ZesWzDF9xVO15g32YtGiCwCboUKgrN2E6KES31rBE+6yUEORUxHvoNZMyxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kelv5i2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXgXJShk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kelv5i2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXgXJShk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GExkO8914118
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qRBKaI+EKDVBkTuqo23SHS6X
	KkoGrdZE7L9T8y7lLgw=; b=kelv5i2sxLwXPpAudR88SFcZoC0Aa0L52TbAQaaJ
	PcrzNlAD9/shTsZqyOo2mzm7wYeUFVruC+N+zYZ34UHHcMoWbh0JEdjfU2EAaEht
	QqWDpl5Xfz2ghz5Xcv2DHqO83DIUcMyCSXDNfz5xNrPwkySuw92GNc1axOS8dZKH
	onKRcaKxcd9Bysp18uDwX3MDvI7IwRu0vsN43dH81HbzUwprW02TT5DRdQguSMpY
	rzrkwTXAWvzaiFlc5sRvrrvgTc5auG6F9tSCAYCQAuR7a7mMcT2L0L/KXOWUY5x5
	4HEWQY0A2oajbPl4/coXPgr3aywnLSjwxrmFyZ2w7n8Peg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqqjur86y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:17:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5329ed28bso527295185a.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 08:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580269; x=1769185069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRBKaI+EKDVBkTuqo23SHS6XKkoGrdZE7L9T8y7lLgw=;
        b=GXgXJShkNrw833En5szMQSwQXVUH/lgQikr7/VlUBksKvLeVSBPtzfohOaLBdcVac3
         0HfCJrjm8K94dpIS0D7WkOiHBKFtlipdPF+ETpFRgBqTy5xW3N3SbX0VYDVLebOlP75F
         tFqSN0osNIBEcaERb7i0pldNDOJ0x9yqFXNnLRkdA/U9uFOLRx89Ga4Pt6dETBVcx9gN
         y0vXBLJiI4pXCBQBw4OrDUB6O9iakdlGDKr+TIvdErRjBWhLyY0fnk5NN6e3ndsI42MY
         RqHvbkh+eK8xQUzJkX7FPkmiN2gy6MxkPHDAZHxvSREpRPVAGcnOdIT7M1PurDdNOWdA
         EXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580269; x=1769185069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRBKaI+EKDVBkTuqo23SHS6XKkoGrdZE7L9T8y7lLgw=;
        b=nGfY2LWeFtjXd3ZYgR10Wi92BrtWlRKo2+aXaVfqXqVlsSaZOMgFaNqQeqXnANfpHZ
         KxFIpziEdwa+ElP88C9iyXm8DlUEvP/phpaNGj7UE2wgW8VNCqeWnxZpSynBu/AVLF8P
         Q/jjTPge3qHwsFGVruUlcpkfptF+P/3feTGVY3mEcveR9Tt4VRNV3Icj3DO4Lv6og9GX
         Ahb3QIvEgYFwaVSx3Zny3EWGZojYfYN81KCWGlkVrn/gbLUZHsG0AbP9hO24lHU92deR
         Osy1kE7ObCsg7EV222NUZjjJs7Fc+d1OJ2bxpfN1E1Hd4zxxYWVdLep8SrwF+74hdZWK
         Xfpw==
X-Forwarded-Encrypted: i=1; AJvYcCWpg+8tJhtOtTE5xz51rLT/U0lPO4iKLVXtM4SakYL8JLB98Bd7K6+BTDety3DB07/godFvpqG0nyzrcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdK5Ii30OXkP+25Zc3x+ZC3h4DGWdcBPJ2fYQSYJSAa9sHt8I5
	VuXnhSBTHQvPM8HcohusSGL2I90lykLTwGnfYEqF2LwVBTx5qcoHTYd4qQb9pFe72VseBuQPkh1
	5LOG8btw11z9xYhS7aE4/vR1e3MIicEUmvlyzfrgryzB+80kBLf+n9MuZOiAfvDQ/Mg==
X-Gm-Gg: AY/fxX4BxReSp005Ei7IUQv2Ip1E682u3cjbk4iNns+ImZwpO3ftOXg7fr4/ZN0C6Ot
	fhXwQyy8++c83CIKjLYl0Vecm6eqUpSsPTuVS3A973BS2bBXF3nMlZl3QPogIu8P/jHleJ5Fuu4
	gZBz8xjetUnIDRihioK3oCrTlrZbvOLfJDxPzf4KqmfH83FG1fZ0vel3w9WhewSsVGPmu4E3k9s
	hmv2LuyYk9t3mPWY7NnKmV8WzlfAfaaZO+OYIoJt2MFQdDKpx8U1u0Yd+OyuSfYH9kxJnO27ewo
	3dZ7v6ieZTaDa8RNwuzx0NxIkLeC99mrS4S6egJbgWCQ6dkFo+SeFtIOy4XerxQvuNaMaHuDHZ4
	5Hy5RD2Ko5CI9AhRxo7eYoadNFEJl7+7+ma+yfi4fiOHBMr/ITQcIrHzpdMNrIcLtgT7zKRs/eg
	3+VOtESqY0GAJlA42addikWMA=
X-Received: by 2002:a05:620a:472c:b0:8b3:c8ee:7240 with SMTP id af79cd13be357-8c6a66d21f0mr532695985a.5.1768580268165;
        Fri, 16 Jan 2026 08:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8b3:c8ee:7240 with SMTP id af79cd13be357-8c6a66d21f0mr532678685a.5.1768580266243;
        Fri, 16 Jan 2026 08:17:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ed0asm895490e87.19.2026.01.16.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:17:45 -0800 (PST)
Date: Fri, 16 Jan 2026 18:17:43 +0200
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
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Message-ID: <vpyydkmjvrcp75bjwbjpfcpvaopv45ljlp3tditfh3aifv5cuc@zh5zqfi26vho>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
X-Proofpoint-ORIG-GUID: zKGnnnsngzVhy_eA5NcWr6BJdvyKy8TQ
X-Proofpoint-GUID: zKGnnnsngzVhy_eA5NcWr6BJdvyKy8TQ
X-Authority-Analysis: v=2.4 cv=atu/yCZV c=1 sm=1 tr=0 ts=696a64ad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ua5qo8SU9V0ZK8mivTUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfX/nNx9Lgc1oz5
 zq4L0rzrH+cMXkPErVpCfSagdkqvUeBmTY9u1ozOZGZf5CrMt+2ulFD6ZtaeFHdALgxD0VvnsSh
 SrH7At7CFiIG8TviyOEsHrW0GnsL7ClRb16D3rqvLKwWgs3pwdHjpZ9MnYXJoLYH+N1Wf/VFML7
 q2ok3CfRBlNmUyOhwVIHw0h8wKJQMrSgtMD2HVrmOWnJEUh8rol4Ij2yM0ZxBMpWBoWHjQ7TUq4
 GpBJvVCeQYSWWa8ZpP1L6UvltlxyC4H+tKlQgTxiAlSqcNgn6/EQvgiS+3tR7LTQoEK8m0meZmS
 EmQ5Fa2mEaq9PCo7HKWNs7JQawlp/CJZ4MK6+BKYcgs4kHjlEM4XGVefxK38FsjiCB2RdGtpvYH
 oK1Bvlhozycliv70WoD1GM7fqHusRr7g87UP43uUELdOrGvZunbZCw6OtOjNZ8bXjOShqypGeh4
 xgeBcry6Rs26W31KOKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:51PM +0100, Luca Weiss wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> the missing pinctrl to make the WPSS stop crashing.
> 
> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> @@ -962,3 +973,9 @@ &usb_1_hsphy {
>  
>  	status = "okay";
>  };
> +
> +&wifi {
> +	qcom,calibration-variant = "Fairphone_Gen_6";

With the hope of getting the board data submitted to ath11k@


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +
> +	status = "okay";
> +};
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry
