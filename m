Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E525F998
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860658; cv=none; b=exUbAbppjjX9KY5IqT+URlVpF83FgW2L6Doc6l6J2b8xXXFSEmcQsN1FyzIKbnhoF1A/PC9eFsD+GfsweQUX+p9BuQkqJ9A7ny2reRulcLktWvWSv/FKnbvbNHcfU5qTaAzWvje/h9liLFXT5VK8pIvV7SC2CirezE/CFVVaq5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860658; c=relaxed/simple;
	bh=+FdbxM4aj9mP1SbsToRhZ6+p2wunQxJNdpM0f3ThoF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJKlfozywHz/3En697GsPUJRzX/gm6aSPSwci6Z7+yds+ON1xjiE2iy3eLJgR7/TM6c/xp131q1wBsg7D1mv/PyUuOhAsAr8XnX42XJRYKD7JN3kmRqk9CYL5vXOvdPXhTfIoMaJPdhOW6f3HLGSjG/wb2gRwL76/P7L8A8ZX3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8GDHhBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8GDHhBK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P6gH9l011686
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GH3vwxnpiCDejx75av7WZvVu6YLOFj4inA7cuWsbOD0=; b=P8GDHhBKPII7EA/D
	1VVUtNIxN3Bk31LVm9XY1lByXYAke7TVpufloT/GyB0evkC6Q72Pa1iC160hVy2s
	HRBjgkygLoAVJSGaFwvmH2HJJX9EwSLv5HY4HysCkPalXcJ9yGkINJd9hQ0ITDrJ
	Rtel1EZw20v87D1qg1mfPrIc3F+ePV4BWNRlKDEAKNuDGeTScKAc+xAFVyLpq8xV
	N2a27ufS5ZjHX47UlH2D4wDB8qt7ISjG4NEd7iCerqlNION5tJ8DF7B2qOjMgWvX
	x2NVaqDkvJZKAGuPyask9A0pwqUVYY5isaMwySC06NjCExEzpnc0+IHjjcRCntIQ
	9BiaCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgg5gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:10:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ba561898so115730885a.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 07:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860655; x=1751465455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH3vwxnpiCDejx75av7WZvVu6YLOFj4inA7cuWsbOD0=;
        b=TQmY+LG4/hotK14E/d0WMLc0JyJacyi0zQpy+aG33cWrC4owSsg15aV6tI87XTFGFW
         by5K3ZvNHWO298elsIAtLag0rt/lXD6/K+7tufV1QvDLeBd9z0RK/krDSsMCtBiLiSvm
         VeRpaf+SJFSHiZX+qbKRDBESRJq8EqyRWkeIvog9pDhWklzyQKMUaHxqwuQAbGXrHiJH
         F0lIVx/VP9HKcaC0zzu9jcY+ZS9lqnI6k8uwGwiq2q7kAgq2kPuY2YiSda2Y66inTkPV
         7R5Bf9/+guzv2Fe57RO2c3OmzYKV7zkOHi6SjELSSFLl0CqLwBUGgI8ruFIzNuzdqkbD
         O9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX21f6lFpYsT8qDRFD+Q641rlDeDI5J4vLG7Ia/D2Ni2ODOWm7KmOadKFfEJY9fWBmgs7fmvUtagZ7+Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Ss3FsxkFUIFXVoF74uhqpwz2jd6t02syCeNY3mnbyvsqHCxz
	R3qpg52htrWjYDLFOY/Cq1FKRan9d1H2q9qKqTkPXrBnsMcW49/xVfl/9XrYTq583R/a4zo83Ko
	E8Ewe4OtgrEJZwu1JjeQK86J5b12KAVl8jfe0bwndeOUGjmHTN+Z9wBxc8v1aXk3Z+w==
X-Gm-Gg: ASbGnctWhY4uPPMMExML2jftwjY8zj9WdhsTSx3rSsXkhNJ+oMaIqCBSgxzSXul0+kJ
	Oz+2GT5ubD//Qg2u339R2PCfOh+pqyqpKTUztsOdH7oVQODEZUxn+NHaHQfFpDkWIAI63v8YQTd
	jG6iJTGGWRZvIgF3BbRQRLq7FfxBgtBMurGwV8h+VekF8ZnTF/j35K540c7mTuE/ohqFBFoH7bw
	tG5/SuXJeiYN8rwCoh/p68Rj7lLtWJijgmkcO87++vFoJAGM1fIUdMcy0odnP/uWQnl0OjDl9vm
	iXSFiQzdtvCKk36GIY0YZYgumiM3EtvipVwvqHgcXdcUJlifOhlBmqUFVnfZsjpYCo7xHmGRK6H
	frDw=
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr137898585a.4.1750860654919;
        Wed, 25 Jun 2025 07:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuHZPwG3CWK1H8PipoRERIswBPtl9pbQ0/GnK3KT0ahCWSysQdAWxntYw7bkWiIkZnC0WdcQ==
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr137896785a.4.1750860654390;
        Wed, 25 Jun 2025 07:10:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f197574sm2568630a12.7.2025.06.25.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:10:53 -0700 (PDT)
Message-ID: <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:10:50 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FqPRpBp1Jh4Ld5JAeVSLHvDJymk3Hxre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwMyBTYWx0ZWRfXyNdpP+YFoLzo
 0t+9FXinflpZ8sQanQc4Kg48IHqjsQA8jVyT4XAiU4TpN+XFJr3qWjfs4o3VnWKPB+ErIPOk71A
 UEQ/EAFQ/BV114Ob4suxKxQzjlBQerSDcwkT8nk04dDl17qMT9ILbJTWoITEciySMw+CfrftzBu
 sxlzqR/kTNW5IMNFC0jo9bJqAkhXfMWROdAaVF3k7eeBr5tb/La5uIVP6uAGFQU2PV3B60vdWP+
 pjqk9a7bqzhAi42JoKg5d3cZ4XCBTy0Dri3TDj2hPZqT3UHeqFaT1mQ3qcq++ZVpY4QtWYKQ3tP
 qngQbsM43YhgEHJW9UNmC9EmzaROogSO1L8chkPVqyygLBW1C4vnJCd7ghSVcN1ZUouGKmE6p0D
 VuYOu4VYq1ssefR7BLqDa63IK2O1pTgX0md9SyPuRJo1bTRlNmyEuNEZ43kHbSyFHihe4xZr
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c036f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=DRLuFLMEli8muENjmjUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: FqPRpBp1Jh4Ld5JAeVSLHvDJymk3Hxre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=956 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250103

On 6/25/25 11:18 AM, Luca Weiss wrote:
> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
> LDO512 MV PMOS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW everything you said in the commit message is correct, but I'm not
100% sure how to map these LDO types to the existing definitions

Konrad
