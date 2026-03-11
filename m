Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89B725393E
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193663; cv=none; b=TtyvJyfB2lKPFnzZWiCipTxljsYgzYSVSAO/hspDyqIHsz8HL6qErZoHRp2PCodqhyoedoOSpufEBAdL/gBkZkAKJ/cSq9JkaozpeR7tvnTnnKYnHMqhWV7q/Oj1qI4PDmVFaRwHKr9xmc/ysP9i4Bqn3j+TK+Gy+YGN/mAghG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193663; c=relaxed/simple;
	bh=zSUWUPAs46XLNNnK6CyzBI8zL6TuErcz0k+5R0BNoCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqwGtiCUh8/WWeAv+3xW7ObTZmQBYcNbI7G1RTCWCI0R6yJtpwMbFQoU5zJPlzFHsW42B36BdT867wIJnTZp7sehZUTAV8gVR6x+zrulABf+sOysSSSe3jWKIotknaz0ld+3CfJ9xDcML0cr+ZsG8dMFJLhGDetmFI15BC+FwyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eO271O+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5WL/SSQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eO271O+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5WL/SSQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AId2QM3760401
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 01:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIVT57SowEfFMepeOGCDAj6rTq4EE1pUwY2R9E/rurk=; b=eO271O+paj65f68Z
	27SypoFfCFLT22Z5HYQlcY9rln7Czy+MK7gTgqlF/0dxrafQVU3fnyy+uq5gpFFk
	f3OPgqp2Ze6y/OuyKfqamj4gVwwtrIbqvUI/scWfEz6PPVT34IKJumpw96vTeWv2
	6seCoskJOoeLhsI0YwNZhjj3c31qCX05nEY67QAYTD7s+R/XemUlfNz1C/gkGgHT
	ERuLB88hv39ttNQJ3vH1HniMp8n2R4W1dZXmCMk5nlgIAnm8/htzn4tleL+/a1L2
	QlTN47bei3KwAc0W5JIzDXyjCfqf8pXzJ72xRBDFLwkL4LtKssbrb5rXZKKdAPSq
	eij+Sw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujr56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 01:47:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091a96f0bcso134631001cf.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193661; x=1773798461; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JIVT57SowEfFMepeOGCDAj6rTq4EE1pUwY2R9E/rurk=;
        b=Q5WL/SSQ5KXJdSIdW0ILYrNWDCKzoTkpZDo3nswJMvelMJTIy1GW2IMFdhP4khUQJ2
         nfvOftqG3ZMi4zQXwv91hhY3QoKkNCrNOU6Ndc9pXxWGB/7VKRbuEuCT4Nefc80u9vXo
         r7OT3tT6z03L+WPwz7LGkNcXK9/jH/hWtGUpqyJj3Ps7dmU4uLtz6F4VZOSaqDnsw/2G
         YLnNNHeG7h/fj7BbvobroRMd31gax7ahn/P7sF4NbjAQl0PwQvP3V4SGVqfzjJ+9Vv2E
         wUwfLcYO1frnXdv99c7I/hL2oE6u8SOp0xm/6AHnO6n+ZrqMXZJjA7b5MGz5SVq0BVyL
         YB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193661; x=1773798461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIVT57SowEfFMepeOGCDAj6rTq4EE1pUwY2R9E/rurk=;
        b=mnAWCQY944sVpdsJqJ8aQyJIl6SvwDng4CggtUyKuY93eSxoRCTF9pZJ2Kctj1oRDZ
         YcCk8px2Fip/UanR0LVfy6ZVkOAZ37pGlKKEY3Q++l8lOwBhRoDFWv8ikke4cJMQfiJb
         pWhvB+QCZHMLaR744FjeBD6ghMnSj+/f2c1rHejKtgeIhk0/MZlRjsc+DQah+4YP4f+T
         cYnoz4hn+7jDIEuTuc5ux1RWM0puNcZgRFTGw0DIJzCt2voIZOEPKoGH0raCpuwIPOft
         tpc/crLHvWNKgC7qwiIyLFXgbQvk24iY/RG07aPHiKFS0+B5DMjg6YcQlRyJX2Q+WJYz
         UZHg==
X-Forwarded-Encrypted: i=1; AJvYcCWBFStJyBGB2xK2myebpQXdnOwD5O56K0aEVXUms49Amm0/yz3mHQzyvsG61+TYJuAIbtiPwaw2M1Ubag==@vger.kernel.org
X-Gm-Message-State: AOJu0YywhIxqhr3GKABPNAWqnbPDoGR4DmVvJltFOM6Sc6TMt/i3luA4
	oebC5r6jNwOSptPwwA66NbmadRjqkA0N/NnOIyUyTvqleOfVLGcOEUMBHHMiCzY2JHW53qKlJ1L
	pZjFWqAkimA2dnU/Zcfdi3V5qEHKJB8OmlYasyHY52HH7BTFZ3l5BcORNhaWtBHfQfw==
X-Gm-Gg: ATEYQzwoM9Q5YixHAtjlpZFI5zuGKhkSMrDQ60iqr96R6HM+KV/iF0XTgwjffTxaTeZ
	BOlT6kbUBHEzh6AqZjToAy3bi9vN6P+N8L6O6JJvKa/XpBVM5EaDHYYtGLMLanlW3BBLUOKKD70
	E2aA9zMblyEkxQK2Wg9gdJwwTZRdXoNiV0Zn86DuYn+wCs6eGEjHMceYI0Qy7orglDciDF0y0Pp
	q947lcsqmbF944rsJgsLxRzYeUHxiVMmXoVqyi8xvglMnBSqA3FyD9nGUvp8UqdX7hWItrX4VUj
	YYfhJcNB2tpmmdVoxnu6ukYeqA3krUFYydzjORvJ05LHCtdprwcB+GyQEHALzPpXF8FjBUpL+Pb
	UIVAADXfjZMghEBii2V+X0cs8SqvGu3MZMOQe9mgAtp9zfa0Syt9d4gvwFZlgffssyOA4/FvFNm
	KPu19cIo3N1GSAfLfKOhilkP0fMAFeYsupiqk=
X-Received: by 2002:ac8:59c4:0:b0:509:23c5:fcec with SMTP id d75a77b69052e-5093a1f49b9mr11130631cf.68.1773193661143;
        Tue, 10 Mar 2026 18:47:41 -0700 (PDT)
X-Received: by 2002:ac8:59c4:0:b0:509:23c5:fcec with SMTP id d75a77b69052e-5093a1f49b9mr11130451cf.68.1773193660695;
        Tue, 10 Mar 2026 18:47:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm132132e87.61.2026.03.10.18.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:47:38 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:47:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add back Xiaomi Redmi 5A
Message-ID: <txp3q5sesogonrbl3lrtntj2m4rkv25rab7tdehzic2rnzdyg5@lr74knjgxydr>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
X-Proofpoint-ORIG-GUID: xHxiSQeU9Z2w1l7cOAlKVNwsdcyyagJe
X-Proofpoint-GUID: xHxiSQeU9Z2w1l7cOAlKVNwsdcyyagJe
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0c9be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=OuZLqq7tAAAA:8
 a=BQt7vz7TcYvtT9m_v9wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxNCBTYWx0ZWRfX5kA2wg6uIKYq
 qwdmg9Bn02Q6TYC9EIjJdAgtIBGoxwLvkLEj488OErz/CTu8Y4VmOvw0Ie9AiyQWbTLkJuGfvtY
 tXZ3MP/rG9JiB/Id9KQl7DHizTL+qarteJE2ZQOZb2FT7/bPqAZflxLJxIU9mPmnIEOgs/muRWw
 WjVnp2JMyPgFKXhKnp65GTyHQrShPLsjtoDlCjLGIM2B1i9kYgr6o/ymZlbkoRZ87LbZYreg5ql
 G7muAY3b/TcjtO0cAq3lIR5LMhF6fzrtVFyX9reNsV8vfZgGVfoth34rWgbhrq5zslt+gq9mD5f
 oTPOK5VGQD36XLvri4ROKXstDLGLQYzo8L+IqAKmnEV36BIFXo6zKBRJjgGSkzBKU07LaGLBniy
 uxGUxAccSwMWRuVOMrT+7NVOLNklv/pr8H3zE+QsPDnFp9u3h3d7vipj5/4M9CuthKTz3y6E/2I
 xfseQYyxscPMGOZKzfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110014

On Tue, Mar 10, 2026 at 06:21:34PM +0100, Barnabás Czémán wrote:
> Add devicetree for Redmi 5A based on msm8917-xiaomi-wingtech.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |  1 +
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 56 ++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)

Please squash this into the second patch.

> 

-- 
With best wishes
Dmitry
