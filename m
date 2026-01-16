Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C0376BD4
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580078; cv=none; b=ak7JJVhPtttmIOsOd7TIbIkkSuycZJ+gpSy6yvy1WKMaTGSTBdMhppNYEX+RCyVpnDvuccBFOD/adX1Z1CVP6qBnX1KrL6kThqJZL6kkD/Pb23/4JFRJ9Q9HBva/fNVqOT+Y4UJsyLdvhloKO1rLRLd2lz+Y6Gca+aQz1FDDwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580078; c=relaxed/simple;
	bh=0NeomZUVhHWI4pM85zDjcobRkdL9ncGwBHnR0fS34NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+o5Si3ggO2ynGrw47VkuaGciP1lwSQbIWBTWGK51zzb7wTwbOFk/uLEHNWCKTC6185JxXdiZ2slQhuqsZt2ehjnc2bCTSVxgvk6D9HYYHTRuMD/lfeag558IFfryC1ytfUb4n+c1vyDFlVoQvue44gV55ETpXBvxbkg/WQWpN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=admLiQRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJFfrRz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="admLiQRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJFfrRz4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G85vuS4015684
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iO9mMgKv5vMJGUuLtgYpU0c8
	RogSqX4J8gWx7OGRMYk=; b=admLiQRsx4aHF3yyqFH8t8EFFxsrj7tfWMDegv/k
	cabrcY8oNgpk0AyNMO3OaFiplZqQizz+ZRX5damsP6Kz7OGi2OORQs7+km2B8l/7
	3I96mRubYBQA3oaXzHj4B0rOXmRbznNwydYCrYG16fCQpwvEnKebW3OH8iKzmTiU
	w/5RsaGieqOERfFtjsU524rWu9C5P0GqV77am1seynhEss7vPNVaxo3151Wf3ESg
	z2zicA+tEYu/iB/QSk8Q2CrOfo72BMRcw3Oe3yT217Elw+82lk0hTTZma4zNicAK
	5WvT9Pzu3bM7cbrxWg0zBZVeSW9lKYNJjGL3ebRo1C2q3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98yar41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:14:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso81001185a.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 08:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768580075; x=1769184875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iO9mMgKv5vMJGUuLtgYpU0c8RogSqX4J8gWx7OGRMYk=;
        b=LJFfrRz4hS3U8kcuRBHtWV40KNJIIYj6mDBpD6SB2OXY02eztlCHk/5KRG/Wcgw3/+
         S2v1KjTpAPh33N2jyN4IVd2OQLOegC45ZlvcyoPOz9lXKcQ18Mf+XsuW+DPS366uJmxH
         pQx+PersWs5kmR0B9Y/gezAmR3AF3wcnYgLsG0cteIWhG/IJ24WSbLpn8zmKoyni8VFj
         I4Fjc2eymf89HVEL6Qy69ORPOe62OvtX96vTyagSEmrwQt5ev2l8mG8A6istqHUoYvu3
         RHW6tVQbJWZP3XBYOPjiJr6bPNQ9sueNLPBWMhvsdWgFTKg0WperQSHPsD9ZkRviFGPK
         mobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580075; x=1769184875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO9mMgKv5vMJGUuLtgYpU0c8RogSqX4J8gWx7OGRMYk=;
        b=RmiEPkLW3CNDTxR6Qv3sKWEFeo3lhrHCf4NSCWn4huTxYUJNEy4kSQjflKR3dEkkqA
         8/kULXNSMEtNh7/Y3O9sDDwvz4qQBFQHCoCHOdRYP5s0JEOoYz0Al/RyHNkkXDejhmrA
         K4X1r+SDK/ui0EuHhfvwChjF5LjMwSBueZzwlgg3nf5f7+0eRLUfA3RzSxz43IWR0zr/
         2it5LMK+oSQWpVIsYgGDFjS+3GXbbuIaqAORjzzKZfn+5zssbXTG0wPqVn4vohbTiM1r
         WrEwmVhBg+pkjXwla28qhpEQaOSGGdmMx5wCPE0kTy/5klmToPKK5x5LpGtv++n0Su4/
         SK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcAWdp2Ba83cSKeHE5kslzTYO/Cj8aEMxAZFfCW1e06p+Fwoejn2/HYMrutwg0+KuSx0G3o6WUhZrCgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mPlxwcWes4XyQQWKVNqZEpI8nDjfiBGTwXrYbg8OeSfN7oWR
	9x/kveXpqKXMz+J/1FNbTgj4xUwPFC1TnGbVWpXmsB6GJRqbHYtRHfxuer0/owVDYQGju7UFL5E
	ori0wii3+TQKd6LR2eeDAseC3JKO/5D0kwgR1P+7ETctmdzcOweTCfm/gtAqVp4/9Qw==
X-Gm-Gg: AY/fxX7Qz5MALHbZndPgP+kXXa+wlHEkJgPPdO+UJJcihBySYcHU2Es590qjXaY2RRS
	8IyaKn9goDZiOqYwpG0nQE/6FhNXYbLJSkOMJCb9CoZXdviXhkQ62yLA3xASWf7SJICyUc9JNUr
	L2vK8pSjWbsV0/nr7d6kfC4qhrefP5lTyepREriaNKg+OL0NrPoL5eJ4WN/hRxOZEt1iFuZeEsq
	BrDKGIhfU3Xv6sntTvwr5c5Lo14I1kU49wwO5/nkvYU3AvoQz1dqFhInpZ6JPj8x8OPoDV1AoGv
	Ki9PnplHqBb7awTMX8oo6HJ2MVVQzCsTrl/DH5aBltUCH1HmoVB/oUIG0lQyfHpNpNjIHK42iNY
	tcbcwFuYevBTixu2m7BP2zSh2HrAwhSch1vV8LgToOwTykI5qHEXaoZJKMe2x93xZ6e0PqO9j7D
	8GpZhi9FLtCqvm4JP2G4giowQ=
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr875228485a.7.1768580073539;
        Fri, 16 Jan 2026 08:14:33 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:89d:b480:309f with SMTP id af79cd13be357-8c589b85a2amr875224285a.7.1768580073004;
        Fri, 16 Jan 2026 08:14:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9ab8sm8728621fa.48.2026.01.16.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:14:32 -0800 (PST)
Date: Fri, 16 Jan 2026 18:14:30 +0200
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
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
Message-ID: <oj4saexuuty333jjuov3chm4qmrdv7dljykrw3d64qoeclbmj3@vsurv4bkad46>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=696a63eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=nnh3LCdgXL55amKsc48A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TwbX2cVYkWWkHVP1qDPg312h1VehaXeE
X-Proofpoint-GUID: TwbX2cVYkWWkHVP1qDPg312h1VehaXeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExNyBTYWx0ZWRfXxv/El8a0/0fi
 xx5QKclvpJPpALmw12PMV3INdMxyx5YB2zW+o0L4vmkQMn6TWysxU1O1A5invoZKRocqR4kXwcd
 Rjn90neP/r7gfXqsHDUj5DvO40HdCcOdBPDgfOMCFNWl0e6mxgjNauRRa9mbgKYyM0fQjKT2O8q
 tuVL9nhIU8PeiYmijdG7VfhEoOM0qx63DUXLDSWxZVc6ljaI/qDCaTOn2jfoBb2zU7fsXxV6F8i
 phvWik1LcesYhqbS9hE7ZABir5H50pPuRTu+E1kwZf4gEf06pC27rPvtv7s/fcF8h+R6xduex+5
 FlCAABv5rLXBKRyEBJL5EujjObzedMdMZPRQb+mukewAlC2m8UvWNGGnDVNpuCw7pjolq5Ypsul
 c1U9PtcWnPf39ZwimrHHcxf1DjuzlUVMMJTfWfLfiwST9m4aCeUHHYeUFhEgzRdhpRpQMpKlaD/
 kVSqHQVpAVuZxk3PQ5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160117

On Fri, Jan 16, 2026 at 03:50:49PM +0100, Luca Weiss wrote:
> Add a node for the WCN6750 WiFi found with the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
