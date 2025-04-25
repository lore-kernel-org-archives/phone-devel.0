Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA041922D3
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602257; cv=none; b=jLourhJmUObCFZmsEje2P2uv275SPysV/3RKotpNg/Y6Hix7TrdS0n7VFFu1/7OWZ3GUuWxgd/JmPksdteH4Kr1J+lRdtb1HD9sqn5T4Gl0OJlLdFVjXBZ1rHPcv1A2qTZTyHfvwRtZ9NdaXz9BvA74/zsZJYA3nU29Vnf/vt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602257; c=relaxed/simple;
	bh=2Y7wGlQM2yG/HX9oFJj7fpeCtYJynzOdaQ4/Ghdq82w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHSGeD9FkS0GPfEroXFzNT6EPCADSV04O4XzrGCbUp8cxshMJ6xBVuiALeFsEHXdF8Cldko1RvkINtmFVcIpGE66F7Aod99PJ15Xs84ScqmY3TqHJRGFR/r28mck4R/VcSJMDxX4c2PYilX+jbyRoh4O6U2AynhkUx/HU+zlQJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDsUZthZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDsUZthZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqHi012789
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=21WlXd5F9nKR9C8cuYQfBPNB
	+eYIpbIQPgwD66DZLf8=; b=EDsUZthZSQ9irj4dfWoZULdGU+QQhAZ92nfQIApN
	wypswh7cwS0wpr4IaswrhqHxE1P/QLNLuZ5KvvUZd5GQmOj7mPKSUsu/RWHBH3NU
	gZzukiTfeSLXmAk74tOSDRBk+7S+Ku2O1pUB69Zjr6K2lK6RCl2m+uEmO8ebRVNX
	scFfEktwMxly00fV7w/C7LUeEX394zM1PvgRnug1ovi4oPuOb9bat/mESkpU8kWV
	b8fksW9aS8U9fIblvZC5fhH0Q7AcfQsocqu3vhLmiHSacq3SA/ntI6H4oh+JNy7q
	OQpf0kDfXb5tgZ3G7vOx/efIdCqcUbVl4QrPLxwVSRludA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1svnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:30:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c92425a8b1so417072385a.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602254; x=1746207054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21WlXd5F9nKR9C8cuYQfBPNB+eYIpbIQPgwD66DZLf8=;
        b=UJR4SKAv5DEQocf8bC8OdTIFCXdfAFQISqs4It3KLDG1W6a1mEDJP8lckLDZKLEtrI
         bpfWT1ciM/6uVh8zbg+h3rusEW1RlJzV4ZBIVeMx+Es1yIJMQpg6bhvU1MbKmWTzlGsJ
         UItkb2Hm7oSgrKyr7fQF6nzfhjTBX8XMVBKobkB+ixoGXVcF9VBHG/I/IlR8kcGgdvpU
         qscsb5hNVwU73xriOvFy2py82yWOJRWCxR7B8HIyDBS8VBlj2JCvOnJ8lRDyhZ2WK7QT
         BllLdapJeINA595+5RNJ3LibK/vMor07IGxiQ+4YNrwlvaWVwhlY+KC4an5kX7fMtDXV
         su5g==
X-Forwarded-Encrypted: i=1; AJvYcCWeyyRhANTMuGVgHW9xZcGYlY37j0Kw86kcMlVRp2fGZzRYklm6rWLBuYsW2VljUV2LSbArjLGJ4Mgt6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLDUWJxisi3pqWWgIqoJj9tTCCJ+8Qdbfepkvx1ZXTa4lGNH4
	0UNR9syhmeLKki6iM70C5laNlOFKqBUnSrvxcV2Ar1p/DgDJFJA1fSAJhr4lmVcGN1Nq1YSET+Q
	l5wmuiA43flLElKXEw+o4ahyFFLeUmB2JgmuUeosv4FwK7H9asXF4fB49a20MPg==
X-Gm-Gg: ASbGncutesBkyt33BKUzqkUN+eRR3fhpVs2zGgiLv+6WVmDrHwNScbptNaoJK4PtLrl
	9lKoFr7YLD8CTrG/42/bp/m2Mdty2jxFt5wQLikMiw8X3Gw5a4w5P3mTaPBtCOpQS/iipONzkat
	yH76PcI4I7tlnvjfrKnKfFUM3zp82fIK1YJdLhZgo7krnlHAL2jJNAliy493iQ/uupE4p1jSQsG
	Xu3Rgw4fyglkbFS2gaz/X2dgqttyKEzfsNgdSRX7eC0l0EtIyIFDLSIZxbGmmeHBfkyLJWx27LI
	fpwjxqzu4styRqeyPglDCGZg9BoyoqguqaRveKnH/lnJZAKThCP8WjR1ooo+0VLfIzspZ570pTw
	=
X-Received: by 2002:a05:620a:4694:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c95863f7b8mr972472485a.20.1745602253965;
        Fri, 25 Apr 2025 10:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENeplBqCuFfk4C2SguqDeztUVPytcVD9nnZXiZ4kjuj5HHA+ECvqnxncLgGy8g+RnWX1Lq1Q==
X-Received: by 2002:a05:620a:4694:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c95863f7b8mr972469785a.20.1745602253649;
        Fri, 25 Apr 2025 10:30:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a426sm8223461fa.109.2025.04.25.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:30:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:30:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm
 defines for reg
Message-ID: <vjfkesae2gszpvjvgfgpctqumdxriwha6lolmmke6fzdfweuda@4fsi7i4kmepb>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: WBMyEs4noTVqAA5EaTxLucDOIolBHtDv
X-Proofpoint-ORIG-GUID: WBMyEs4noTVqAA5EaTxLucDOIolBHtDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfXyr/sb6RBIGVX s8UKaUbf15+fUStCR7ZG6xZpzUCcb1WbbLBo4Jpu7n7PNpM4BBzEX+H3aJgu6VYsmN+uLovQjGk XPF3WywBh18Axu84xcHey6x5q/5ehj6E51FUtJxASh+rC4P+1AqJYALBAlnAkhK7edLsz89tmFV
 M0Sgg+u9N/foGTA0X9AGBUxANciBnrvUJKLLJ7lln8u+fpFIAaVwOPO/qVydbhbhAfTIYouGI8R 9JWvm1W7jkiezGtzaSrxG30o8JRXr3ujJWftW9fyMH2dxSIfy/GDA2N8hUUbaaIwrDV3kFA0nkV LvnFMwjr3MjUp4JXNNy4B+m+J+iS4D1K1CNbLfhsgGLb793us/9kGy9TEUokomNOnl/8td1HiT3
 aBS0dIpFgJMk9P/VlyYSjf6EI2BTrSBiuIhNb/LWFtaNPzCw36XL/BjCVth37ksFz7tvxblE
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bc6cf cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=637 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:40PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
