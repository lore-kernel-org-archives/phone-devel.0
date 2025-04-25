Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26801219E8F
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606992; cv=none; b=cntQRudZJz5MR0WvzwXQMEVQG1fPFJwVEt+RSGV4st8znjMnOjJ/yC+YNMIyZd4sU7+dG36AaYHJ8MLykDu7jDQO6HgV587pfIKM6+eTKSbkdcWRwwZC2ZNRIzignVaaLlKoqKjEVLrI2JGOc/eTkXQCDlsd7jL2x3pB21SrpIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606992; c=relaxed/simple;
	bh=XpCu0lpFGvPHVRozeGP/n2M1RiPHhHTv8U24FaACpr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBO/x7O8gBt4VsM4fOqCmiXZgxeE4STk1EdS1mbB9AKyUYncb7hVXC1A+B+wY4zGYApPlOw+HmsDAzW/l7Rsno7PpVX3boS75jctjV4wo19YNksyKPZwF4yQM9W/SxrD//WHvRbqfUIBdu94lnu92H44OuW6UHboKS4kj/2rZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIUkiHkq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIUkiHkq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwPN032080
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4h/tNh2cj21rvwdHEvX/GLqs
	huQYHrsaHCKgAfdUS+A=; b=cIUkiHkqsNI6WlniISpkNElrAlXvOAMuxzC2ZQHK
	pTcwElswdey/y9ABfVcg9mBIyuVJ68vAQx1SW2z7/a6xhJaLWnkhC1M79dVxjyEl
	UtNWLfBbHxDPv6qm3fwKfIal1w5EcHP69eEHxEihm7INVzMCJVf24+4QfFdBiFJt
	1dXmGd3EGB/v2nkw+AS+cwKDp4fm4X0reTBKQKiKHC+XfY6ZZs8/486ery2VzdVS
	omGC0fCh4QELkzMASdXVc77OUckgDV+IqMX6t7NvvcQYcW0a9lYaosYNxYosZy8T
	lr9vQvgiLimY8d+mmlVyjOOUMbdcKgI8I9ZRZWzsK77GYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19vya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so465037285a.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606987; x=1746211787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4h/tNh2cj21rvwdHEvX/GLqshuQYHrsaHCKgAfdUS+A=;
        b=aol6tjuuXUK7gFVtraFIhNw2iK2N6FBUho2F6inx+I98l/UhocSYQN+ApA5cV6LrnD
         d+i7oA5ZXx556FlL65BY7dElyCJU9ig/kOY1Bsk7xglEsRj9iVlhehdCcURCk7Kv+2we
         GZqWKmHcB7ROvyBx6vthym9noF13wgNB0QgpL/4wod95rB6cIlSlR1HU+1i2/7cokemT
         fi6op6FX5i/816zgEs/uIdVCljooByYhNAfXyzrtbKp17cAT0GiDQs9Zbju7LQKDETMJ
         rKzWvP2GiMMcPY3c6fqVWZmcJcS2b5LTSdPwd3W0hThH2hxsabDsVw7Ijofl2Zqtp26K
         bfhg==
X-Forwarded-Encrypted: i=1; AJvYcCXqETeav4khVh1YzGfhCIFmS1cEFMO8vpm0KSz9siW0X6zV/wWcvkApN+ra/2BcBeFdLw5ZbLdKA7UVhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEm6MWS/5BaexLp8Nct+4Igb9wTkDzgfSPRDnQ3JHNU7z6cGSi
	I45UyQBJx32ALpBSAd5o8dUlJ5Ek5blOHEjITAXeDnzI992AYSSktLM7rGDqwCjsg4bdGr0+ITQ
	H3Vbt8gC7vJn0d7gAOvs1lYk+YNP8pEdfFUtxkt8P6C7ngBB+MCNWdQ1AlL3Mgg==
X-Gm-Gg: ASbGncvKkfauXVP/v2f7VxWX+62lOnciPn94W2/9A3+7iUCVpnaKtosdymvbs2BB5o/
	vIuaZ+PmNiWM9Ww+cfzWSCle5m1kG8erob64cXZvoMlaeKEoh80oEcRDaDnYY1XCshx132T8RTY
	TZZrmRj0ooEmMeU50NsOPCdyjkUS7WuXB5p4hcYHDO6TetK10a/s4ac8yI94nO+m6nuH0MrYL8W
	RyvhI+bv3/c+e/JVRKOMa6UKSxEcQjtrLaPrZ5dwhCcFZN1H0vsqu6Rmig6L6OgLb0QaWI15xwY
	2tPz+foGjd4QDGCVJDOZCsBJrK5ur+tU7InqRfNkHt2148jbbnvLq/6BOrb+qOmnJNEWcnTcvcs
	=
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr1114349285a.0.1745606987112;
        Fri, 25 Apr 2025 11:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb84jAC5pDcE39t+A3nMNSNGoV/RYhRqVe7xaNluLMJTysZD8eF9gUUcxUs80J3xjAUHfURQ==
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr1114346085a.0.1745606986740;
        Fri, 25 Apr 2025 11:49:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d00195f8sm8436461fa.56.2025.04.25.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:49:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:44 +0300
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
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm
 defines for reg
Message-ID: <wawy7z4jrvu4t7obcrs4piyscpusaawgj33lqnhu3dth7zp5ue@uz2btydfyi43>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: 8e0mvZJioSZR4lOB1zCvLsGxZjAtkCcW
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bd94b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 8e0mvZJioSZR4lOB1zCvLsGxZjAtkCcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX8muRxULhZY+i ndnciIcFci02cO3tgv1U20ct8F+MNRvuZzI3jO7QZ8UvVGhp/9y4PLB21E28Y57Ol9HAVdwo+J/ jOa1BEU58EBXXeeauZsicGvtSGOD59wdRi0j7LHQzxXUsMYZhIM4rPxLkPO2+HWF0XdJoJE2D/R
 YRxTZRJ5JOetMo2RxDrxMIVPdcP68vWIOcp+BMYR+9MZsWwJFX8pOWk8teihHH8qmdnb9lOIlZ9 BTV7kP3jSW30kGEUmelU9cvgGi/YQNwMUm11LfEJ3xlJnxXbrcJDz8lsrIOu7mY1npPiWn8VEMP XzuMUOf3ii669x5JqP7HM9f1YQcTPd93X+N3gZD3RG7wg8e2ik82sbQqQ4nrZO6WTKFvcba/tzY
 SRG0RfYMOZ4dEE0lePiQxloFQhyvQBVpJiC22OrfynKGZi/HhjjVy2hX4DrhRV2XJDSkwsWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=693 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:45PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
