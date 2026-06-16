Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632EF330678
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617486; cv=none; b=C4uCe8NVZXMVGjARWVYe3ZQPnRtyGB2wXd8QugNfVgy1av+ei3kE9zNZ3EGcJWmt7p4IkYORkzxDmjNtXu+hNN/723Bl4wYGqfeD0oBrBfPJXR26yh3yezCx4ebUYQs2JtFeCfY4qTZuc8MajMvhFO8X03BQpGiHXU18hINBciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617486; c=relaxed/simple;
	bh=MLdvzML03SyOkOB7+j8x/KwF1q6LqD2pr07MzjC8lg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqkjIGi+ebT+udSgrki+vzNz2Ddvsp6ZKhPhje51rHjO3SG9xMkEgzGDKu75eOpY5JiCpxci0qCbbUiPIwpp00NpzJcHWD9kMhSrgFS6+1ip8s8UEqMczIKN/hACAJTyEt6m3cZuP9SvcnFXIa+8OfS20LfR9blddrLfwYEWY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feQ7zRwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8yKl3lH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feQ7zRwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8yKl3lH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Mrq248528
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iixkY389mAB2UaF1VSSM5bVQjcg6VPpOWNUV9qcsNVI=; b=feQ7zRwAMEddcd4H
	Lcmq5zSB9PqBMYRlTFwlGk6Dxysq9QlKdvGtg8x4g/sEmSrWYSp3V/rZALkl3sl/
	9VLI4xck3XUTxbvC1el8tSrqcd8JZhv0iG+vJWysvOJLytyHYWlj+w21Mi+Hh1o2
	l/BzfKtri7oZ9h/XFJI8J+N8uXgjJbPnLJMTHSPc75i2b8AJ6jl+1hF7B12Gfdv8
	PnKchu7Ua0lSrwfC1bRckqy3AU3POK/AznKkM6rBRqzBCpS3Vd5Wvv+pO8xV5nEi
	9OkrBqkjdzFj43JARTZ7IYPvFrIqvUD04z6I+8HFLLyqMvU/l9zPiM7/+bdxarMR
	ztwCfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs9cpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 13:44:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-917fd2bafdbso76511785a.3
        for <phone-devel@vger.kernel.org>; Tue, 16 Jun 2026 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617484; x=1782222284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iixkY389mAB2UaF1VSSM5bVQjcg6VPpOWNUV9qcsNVI=;
        b=U8yKl3lH2JwnsrcQgftm/KPcihl2woH8r5/dTrMshXZPIQv8k+Zh879FEAssjEUnNh
         gpqh7R2PdQ3MYCR4bfZgWqers1qItVg0EYcx5scBvxMjaH32ioUvCV4JP4h4yA3rg1dt
         3zDU2PgxS1yT4OmVu8Ghr2wTZazAacXhkbaHnp77fY+4luT7SOW8MZek0CHTKE0aG/dY
         5j/U4rOIJWx7LMUCPyyTODYT4+TkmWZ5JrdY/gtZAvyfg+QejuBF0mdYLc+SRQwP9lik
         6SCVF79bySbLl3mTKlGuli0TFjPYTnMgW/gv4rvioDD/GeyHBwSQYvCgK8sYvT823cFE
         3jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617484; x=1782222284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iixkY389mAB2UaF1VSSM5bVQjcg6VPpOWNUV9qcsNVI=;
        b=qbkz6mgWt0IiMPrq3FO6tt0jaWMl7GUyQboHQhMMhINgsXSNt8tDVn0ApRqmWa4QQv
         kpFucz7CPkmcH5J+zKnVT7//sOS0M4RzrFhZVLC9tpOdZuNCy11vWPXy8MhCpTSeNO2K
         9gQ81CC3QeQEHrlhiVIenVimfAAOuITDiyM9IAWWv6tlYVQrI9ppjLqL3MNMoFN4TlsI
         GYqjEDspKpRCKecdsG8LQaaxFKOyBQfSxza241wLOlX9lWw8AJ0H6ZDTErDAAe4OwmrJ
         iotHft+EigAO4q3EotvqujRC+OxXiOYyKfeDDI3vOh1PgvzjPfsvVUBFXbPSLDWlGYME
         mtLg==
X-Forwarded-Encrypted: i=1; AFNElJ/jkrvJAdMTuhsm0lhSNj+ZOLGmJERZihPVKMILMO6Wt4659JCJLOCoG+jFlZpVyeKxB9fuumGQu5+8LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNiovQcDSDqZIDKi5ekiAtMLVaAl1eBVNRcLbkNUTleZZaQreK
	YjfUGO28+cAwhvbI2d6bxnPF3OGwV/2i0GvLTgLzaNfjXBhuw5paQLOugpk7XbQFpTryQG5cfWD
	yluGogJF5cJvUTDNtSxz+uqcPCyY85QbxbdZ3ufGaBaIu8/ur4x/gvnNQsbaA+r+ysQ==
X-Gm-Gg: Acq92OHX2xUEupM9BV/jruicYQTaf4aiGxxbCJjFSo0d08b9eecl9pOidnK0TfDMkHg
	4o/pqTDr+/C4Z2X9ZLbz++bvvZlfuNRNKRePolHhMGgvWwOCK3YCWU8TRyUL+6NrlEJaJGBPK4c
	gcjsXov6PWbhoDYU9umLvN0kJbKYrC2U4rQkOjHKgZWgYV8Q29b1PhnhgVXrQIjfhzF173uaCHx
	hkHkeDC6Om+NZnScgD1cfQmM7jl1/caJca/Y1aejJBU2dbW5GIQfI6kDDidoO6EM9NIujEdArEA
	qQM6WvJpRzqyljoA1fhRi/y1Mbh7h/GfIbdPVfzEHvnrD58eouK455yTghFCriUsYRiZrc6VT2q
	g+YysAzQCDYzI9+59fwrn0YWxbrLAnZ+ZHZhiOANpsolTvw==
X-Received: by 2002:a05:620a:27c7:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9161bc90a8dmr1715602385a.4.1781617483673;
        Tue, 16 Jun 2026 06:44:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27c7:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9161bc90a8dmr1715598385a.4.1781617483275;
        Tue, 16 Jun 2026 06:44:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b4c4sm4970469a12.6.2026.06.16.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:44:42 -0700 (PDT)
Message-ID: <cad4fc84-953a-4f68-ae74-864574256088@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:44:39 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] pinctrl: qcom: Register functions before enabling
 pinctrl
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
 <20260609-mainline-send-v1-sending-v4-2-83768fbf404d@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-2-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bxzC-0kSr57Mfa9LQc2sn7IvlZXl9_QM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXz8FmBH2xJMNl
 N860TQ7XpHqWPBxf//HC1LjMzW23q7xwG/j6+tYLQh7wYCpQudzNggwpXh9Auka3n6mmSq5sWng
 ZVhh7fH2zV4jCcfior5jlQFr7tP0ENdHA0jzMR/RjsLLyQaA5DBxTnUE2Ep2k1lWizf7GTbzCom
 QSvI1Ky5vwhElQ0vnhEUNm/AR+iRx7XBXazcUWlEcAAh7wWhKj0t626HXadAatNL8nAdxXDwTUv
 5igNa+HdlpnMXXoB7FA2th5RV4y8vLgZhds5WfxQGk8QSkhQNWP7YgZ8/OVANn/gr0783TqUPYG
 5MA/Ub2E+vfQ65cfl34hlX1ClE5DrxLy9nx0jsckPGGDb9J1tG5LCnbaUNPwX2Ukg17mvw6/YnY
 AGX7kUlasw//bPJUXwzEm9YteejzPU3iC2Pg9KxJv5yF4YDOK4zQzbifIqJx+3eo7z7B0jiD3nI
 sVphhF6L/EVd44Hy5Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX2wztfZ593iRh
 7OXTYRpbfDPTgs9fTcQYBAKL/4991y/eS3OnCuVsoJBXA1crnMJLWr2pY1LRYTLWw9w/KHV7RD3
 qNtH0WeMrqXThj+lCkMhFSKI3wAkPV8=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31534c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lq5VANsAAuRygiiSL6QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bxzC-0kSr57Mfa9LQc2sn7IvlZXl9_QM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 6/9/26 10:13 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
> 
> On APQ8064 this can fail while claiming pinctrl hogs:
> 
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
