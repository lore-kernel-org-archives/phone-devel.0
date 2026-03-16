Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B28931E106
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629809; cv=none; b=NYT8luRdJ0qw2teeHMPIVIXBv7W/9m+P9VggUxejLt3j2/T+UkudIRt8KgGDqfoQDW6Fg0+InJiJL43Rawt5cHYeLRl3cCoTuLOF6xxS35BLmLUtva8u3/19RaubLl27HQF7COSRagqOR8LVbFj2tZbBHZErJEfp813LnoBmmT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629809; c=relaxed/simple;
	bh=lOx7WGljVCrNPCezw8jw8F0rZM4RZZWdggDm0L7uf5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joeEtXaElKTPGzGLazSXxhzHr0tufGy60oaaUuqjH6NzPbQ3vU3xfE+GZMg5TPNJFC3Pm5WtP41lIYDIXn9M1seSFQqyON2D2z28Hs+LrdC6Y3X1NiqQsm69w+HE4BNLNuBQNWKkDeaO5lGlghzx4T0I0KOtjciCpNFxVcCa2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBatx45T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUUFVkJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBatx45T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUUFVkJY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FJlu6a3236215
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7t58FQ1sZQ91jnt77vuhQFHEqLIaGKlIsv/co+Cw4I=; b=fBatx45TrsVD/DyI
	6eKYxYG3Lvs64KvboDhHwYIcrRonhFtwgVPiK00ZXmV6mm8DO74SEaa6MTUXR1pb
	IN1ti8ejYagX0pcLktDTymsXdw/Gamt2D60InWxpI4x7Tw80OF5ag3ZGTY8RMU6o
	oUD3FC+eBO508iS9KiXldXCuLuhOiDLHNPfAt6+m/0tePbwAaxWkGLpLaWQbn27h
	hPBMf0UjGqP8Qs2OzOilwJ3Cc/z5VDyerA3+oUpWxSecAH+k8W+EXGPTpXtcHdKA
	E9i9QL8WbtOUEvEBmDmbVuVql5pq805kmtx3OXGq1flUB0FrNCmsvOXKoLMs6yRk
	lLVUFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qm04r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:56:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso4745551485a.1
        for <phone-devel@vger.kernel.org>; Sun, 15 Mar 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773629807; x=1774234607; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7t58FQ1sZQ91jnt77vuhQFHEqLIaGKlIsv/co+Cw4I=;
        b=jUUFVkJYNClC2D802l/SgmQoMyOQd9IbasoUAX9foKo+6fMUJ5Ivs18Pzs5wBZqMDz
         1JVzJbw7JTVPnvoGJeadsHVU4a/A7fzJRFfOWJwg0337+K0f8F68obfJvJMTUbyZX8oH
         alubFK6XEG9ekiWilwiTWz2xGYHXkFxHzOHqqTau9AyI/7XI60AQxF5Wc57zC/VSRfJ/
         OJ4yVDJrEtTOUYS0AaG0unwYSUFeuweK+Q/tXUsfixrattLzMT0oiHSeZNfQk4gwNFpH
         ZzrbzjNtcDe6XrDnzPrhIVFVtvvDDU+ZZhQcmXTRGBRg8Vq1kPVgjjYw4+eyUgGxkvwT
         0nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773629807; x=1774234607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7t58FQ1sZQ91jnt77vuhQFHEqLIaGKlIsv/co+Cw4I=;
        b=Gim2bphFPy/qQvu8e+98XMxOTiUqa1Fppaebm87UdZXYGcA/QbWnBhmTuoizNgmsiM
         2mAIvwmxSKAsMRUTblXkX8/ERn/9S5ZElhwiTpG7fzATWEbb5xHtDKbWenia8YytgNca
         RDQNa/syq2g+xaq3aJGKI26bfXowZvwTjvqrsDJj+x/EFQmtZ3x+qyqTXg5kTkVm5Q97
         XBiZzjqSi9Cy+vwXJggYJq1re1bI4fmGIAGcjZ/nfhgldaqYbxAn93etdcUN+zdHUtFG
         UBxlK97ZFJ/h6y0zRFv1ETqbYoS231gdbqgDPCUY9SCQbB2T6Ag7HpIJodArh/GsE9NK
         hwzg==
X-Forwarded-Encrypted: i=1; AJvYcCXamKTSuypwBLvNyw3co4p+LfKFc41ClnxOQsFmhY+4/y5Pv5NlJmTQYrqy841UG1VJnYn6nYfE/wdz/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOG/+DAyMxyWcSTnxLjVjarEJuN5W3ulI0Jo1ZRDydpRi5O+a
	DxpsN4cNEbVnsQ480EiQHWqxsBCYQy7120WNiUHWfa/woeBfoNHnuDG6Sa5eLEDG/PCKmY4TRcp
	jOFjoy52y21EaakPLnNZkiBfntSGP//yNi1QomgHL3YR0TpBLHfYYjp/GU1XkEU0pqw==
X-Gm-Gg: ATEYQzyP93QisW/uDzbQsxXBHEN0LRXMbdhKFvo4U/ld/LGYoHEdHFu01ZXvC/dVZCH
	hbJ64q4D4to+omn9tUAoINsw+tT6qKQd9JNYRGmLPFBxKIhmSpLka/Zc2X9kFxVqZn7CnF+ddlc
	4MbnYoPF2QnGBZxDGDMuuATCT1ojvedSdW4FDcjGG4BarIssvfFYanOfRPak3znyTCfrV5b4E9l
	tIcpAM8xGqMZSkp5Tb9hU6XJpUhTsx7hCDJkxi2iCErveMKcW1MhvLwrAswI3IPizEcdk/NArKo
	MAkZcf0VNZ0h7u+XJhFr9QU8lCjQWHxgfvUmmjzxGp10jhgG6T7jqJ9vZ/pgCc4He0ZB1UtVom/
	0d8WF05Or4GDV7jQwYKXBizcSih0/CNRWX2lLT/XLfuQUSt5pP3q+TdNTyA6838CgedEre3/l2H
	kTWiEwUfWGFfsTGUfQ1tLWgiQ6JnLGfCL8vKg=
X-Received: by 2002:a05:620a:468c:b0:8cd:b315:7399 with SMTP id af79cd13be357-8cdb5b5a7ddmr1529631685a.46.1773629806586;
        Sun, 15 Mar 2026 19:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cd:b315:7399 with SMTP id af79cd13be357-8cdb5b5a7ddmr1529629285a.46.1773629806160;
        Sun, 15 Mar 2026 19:56:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366682sm3117442e87.72.2026.03.15.19.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:56:43 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:56:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom: Make a common base from Redmi 5A
Message-ID: <75jgqzlkh7xgdtwyqnyny4pp37czkpi7p2qx7givpwkz4fco5w@aaugsmkvmr73>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260315-riva-common-v3-2-897f130786ed@mainlining.org>
X-Proofpoint-GUID: _XUPXK0l67lk46Gah7p7sc3OC_prYXkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMiBTYWx0ZWRfX9dy/iMtP8KwU
 au+/d8CNQKBJiThIrNEy+1NlR/e4a1BfAPL/Mp82zcYz2uGG8Cc7ocKpD0PEH2MBNegXAafzQUs
 epT7NFa9JyRDvF8YRW651m4tuyVe6deAZb/POEuz42ervyX4Ovfh5y30qiOnBzt2HCd61aG95hm
 aw5KU19k9ctPpAssqhPxHtYD/Td4/qqWgKzoWh7KwoaR6c8mrdStyBXkH6TN3cQU6C+YMy5Jd3V
 bSdDC6ta0Te+nz9kVOGFpmjBqTPka6RIMWz5L2/4prAtvpOlQ7gZ+N8OR6T3IOoosXbDaFR73pZ
 eJmAPUoHdB8rV5c26fKwSxvk7JYJ80Uiud3GH2M+bv1JpnDMK9kSJtzFi7OV/0goIrJF1y/c8f/
 /UYQbHwB/HHYi9B/lWscXK8OfKFm48ee+mT7k5vLX3nbwVXB1SWjnKtix3Z9hQ/l+agFdW4l3Xp
 twgLoeyimB6frIjOMUA==
X-Proofpoint-ORIG-GUID: _XUPXK0l67lk46Gah7p7sc3OC_prYXkm
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7716f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=hBsfu5BoBQgbZ9FLN5YA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160022

On Sun, Mar 15, 2026 at 05:26:20PM +0100, Barnabás Czémán wrote:
> Redmi 5A was made by wingtech like Redmi 4A (rolex) and Redmi GO (tiare).
> They are very similar, make a common base from riva for avoid
> unnecessary code duplications.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 308 +-------------------
>  .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     | 315 +++++++++++++++++++++
>  2 files changed, 318 insertions(+), 305 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
