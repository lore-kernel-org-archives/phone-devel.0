Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2521A42C
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607040; cv=none; b=btSFv1Rio7VfenfSinsJRth461d/b+XQUIdMaqwnWNyuMR08SLUzyWE/OTBhxVqPZXdyesP7jSdP4UFS7SV70d3yLM6UgBIwAqnXeu1E8yGbQbFueVw/3skGfifj6oOnJZH5WvyDfx48lz3pAGPq27stG/+0BQV2UaGYpqy7Gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607040; c=relaxed/simple;
	bh=3OkEVS8dQnFFnUr+eA5TheSMiK17eLIXgacYWk/jb5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSnXlnOltu5yQHpa/zR4FQo9e5kc2Uza4ixum0DbFhAPQm99j/NBKd78RP10IXcxreTgMFW59kDcl/GqJ1VosYPRZWQnQTE+yqvwxcGNFasfocSU8uJd5+uCdozaLQ0R7RGWWm9C551Js1vDukemYYrEFrYevU4nCIhUzy+rYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq9WDn60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq9WDn60"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFtq008962
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OVs8UbElJTYQ1nFLiPUapXZz
	eHRhnrnlXO1oTNnLdFQ=; b=Uq9WDn60D8vC2re+Jz3OWodm5VpCrxaAoqsjmniP
	QmDfk4L5PXItrf+1Kw88H0R7CzrVrrd+Ou7W0HNmvLs8+867R4YRg0q59o6n2md3
	pmGBMMW/SMNtGmzOUBZwcgSCmPzVBByTJLssyCSVSZVu+gY8qg26PeO0fz/wLx4D
	5oWsDPm5L+VO86//bsnxuJnT4hSjRViL9cjKxjlDLc5Do4kRBbjgBuRpZaB58cpf
	F/kF5qDtw0L2/RTDdOHMaJyS/stkMoLP90iPDlP/sLBQpJOFkYEunZQWMm4Su0OL
	YuU8uBAt/0d9dafb0ZuXtXKcQfS2tVqmrY+ivtJZJt/oQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j385-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so384237985a.2
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607023; x=1746211823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVs8UbElJTYQ1nFLiPUapXZzeHRhnrnlXO1oTNnLdFQ=;
        b=exQMilO4YM5r8u7Yqxs8o3dTC2L5ntZUk0Ps9Fc8hCjy1s/rzuVJrh26QLmWXAkMVm
         BUV4crJQ3NbAGWA885ZfBUhGQyP/JJ1nx8cqsMSD8HSfkNNtzQ34L7gKfHC1aoRaNiuf
         V6xwZwINA/Wi46x7sJUMocTF9o8taBRYG9qamtspPvGH5AVtSmSdTEybe+ngAWAj6bYa
         W5ZQg4PUDTy5pQJHs2QVA1N279hzMUGLVL8UeFai6BhDV61yv1Vjv0XBK3zW00JNVV8S
         GmQPR6GizTm4tvFJpRqiE09UdWn+y9vLqALNFTOkSpvRUEdVPAo18grI6F50zfGwoZaE
         UOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDgz6McZsVw3nMMjAiXAV6ciovnrdDgCZsjzfa5FOGOio1509pzeysKcLOtrektgb5omCe4D4o5hvT8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/eC6PO9oJ1W5zVNmb5SBsW0/ChNTqQMqBsp/ohnZw+ae9VaZ
	90z3UBqSKvp3PNgzQEiBqn92ZKieiiR7qxdQKZIDdpjqTXAmto1AhDew9sIyZ3htadWXMaE9op+
	IeVBMdzOUekRaCdCKmhsq1BhBo2d0bGTq+Lh/GvdoWBnWVCpn4nOrwInMjwQ7+A==
X-Gm-Gg: ASbGnctcwIHRVtqrRO67/nuFFMNvKnol/YtoEiC7y78MBE8qXEBOHYAWfyXQTRT96ZK
	JLTbAGX1/5G8MaLV3ubZFi5aQn/TqUsBvikG7IiMb7copRSk/MjW3d8A3YXjHvv8E3ywm8fgNiA
	CyeQQhSsLeaAHAAebONpI2fNze5w2a3tXUxIWBs5XA3KmIdZbSC/sT0sg0ne4uBm3jxev1lNtRF
	BSbGsWPf3MQqyOAmKHmG5ex+hH75pf+Quq+4Zpyng7P+2mx6ECHVeFFpb6XYSgkYA5YcmInk6CA
	m/p4qbzZdspZMHtZ4pU6tvdL9EBfnOjtohbFktDVthsk6qCoJIke9+FT6OJg/EW3oFE+/sIioao
	=
X-Received: by 2002:a05:620a:3907:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7c966863a9emr93989985a.2.1745607023581;
        Fri, 25 Apr 2025 11:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT03n8z7SHkwDaulevemaec2yJrdYdctRXzxhbdw9an2R0OP0F6xKCFqghpdGVE/met9dTSA==
X-Received: by 2002:a05:620a:3907:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7c966863a9emr93987585a.2.1745607023267;
        Fri, 25 Apr 2025 11:50:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca842esm688372e87.164.2025.04.25.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:50:20 +0300
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
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm850*: Use q6asm defines for
 reg
Message-ID: <yyeijwvwva7hwehpcyvy7empyfxmzfqei7i27eow2rx73mh5n7@kzwkymdlou6p>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: d82kdd_0TkJxrci6TgH205bRrFR-pYas
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX+qbXHvHJbYn/ 7ukGuux3NJHThclm/VBQ9lZqXZzpz1ya8FsbqGbIkQQuHcBomBLuxNqQbxhvaMmtiy18JOwnU7i RQhX3Bw5O/hWy3KVwWP+mtb3OmFSYZ8VXlSwHLtOQyvG7zls7BlYzFjBfSeSIRwGN+e5lJj7+zk
 bslCGIGUy3xZI+5XC1FT4PDZxv9yuq6I4h4q+zs1kTsh8DHmqKDbCedKEeHfkKqDuAOPosPZbe6 7yLwSP2uP+ibanDGzSRY7QucppQlh0ZUS4E7UsvE6twLxhGyy31bkVEnm9fiJo7AXAsZewKdquv XcYYvJ67Qt9YsB2T7BuHO0aJKSmbEJw3aIaCinIMTynaOKp8z32RBjlxHUIVJ1LIKFTzx3aMEfv
 OOGekuyxdM6Y2VkL/PI60MABtGA7+eaph5o8V7ciKWbYpCB1NWZEn+FOYFBX7cxKY+FJ+Xb3
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bd97e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: d82kdd_0TkJxrci6TgH205bRrFR-pYas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=575 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 01:53:48PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
