Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659E3321C1
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581452; cv=none; b=EfsYVpCTbN//HIc8tvVbh+cYhHOaY+x6L8wiu1hZFj9xiSW0mayBtyJLYc5SFb0aHZLAQnQRqrfzZmMEKZ/ef/HTyFjiFW6tTmfZEKQ7GakBilFouza04Azjxwl0kRBhZQdyjcueMh2635iguOHXZtJ+BxIY43fkAsjus392T1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581452; c=relaxed/simple;
	bh=H0bxDrD7Q3iu1dnJy/oLm0o9F6Btp8a9WEHS1lwFwQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQxX+ahibHgjYv94rn9qMsI4Sok/RNOkVR/CNhJRqGNV4BoOxyKLc06KJhRWqc1Kdmr4quJm7wso8dZrqajmvLnSp3UUTueQurLcS6rFzWtykOMuOnkwvQCITj7rZK24rQUELY6X5q6M+d0Qi6qT37b98O0Rh8lLnwhvHX5xQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAlLT1Zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0NABUPH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAlLT1Zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0NABUPH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rm9Z1851261
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td/GyC2H54TSnBsbZynZSNK0FkJDWvK5rVS04DwJxtU=; b=oAlLT1ZdkZc/HTEU
	P8EungoIUuX3fSBU95Vrnj3jBchh/utgHfR2UhfmGpuWq3X3PAuvPqTKky6E+qJn
	oGyiQFSiVMNG+ygP7xSnm31gYTH1U09aaLBAJ6oy5KHKQAbsg6t0GInyF7CasBOQ
	qMXTx0AXOW+tVMyPYVi/x4bQT1Tcnpn03tDT0j2q0lYGEYuzOac4Lm5gRZ72a8Dv
	rkNfXErAJcRNzqTYQH97k8P3ho2s1XWH/riNHYVtSEfgccmljtnUb3O6gX0pKw06
	3eQEKmyWyvk/1nEyJsTg4/STJ9oZ/ka5v2YVTRCjuh14Z1p7U46kP1x8FSxk3aFi
	KegcQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce9ng9ryg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:57:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso193031785a.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771581450; x=1772186250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td/GyC2H54TSnBsbZynZSNK0FkJDWvK5rVS04DwJxtU=;
        b=Y0NABUPHE/Cw7XsdpWYQCSHRni1tT7jLCUnSc8WGzfmjDm0groM4dz39SpMNf/iWF5
         nmvHHvlZjtOIrpdlBMdEkofDLTtR/qbTLCnvry4K9wj2PV5tv/p5YlPiI6Vd0Ca8lD0t
         X4UQoirv83PzDBGCo3cJ7l2mUX2yrEcTSyum5ujUZxDnixhhfwmGce3imcRGJiKN1GbG
         ObkqJEmwSg7vqqjFi1PxTxEaPsnIwrBNAi/Ykz3/IjWvMZiwIno8+ySwiIp3rue1yNNB
         Iz6QE69ReOO5MuuTlFhxcyrRbEW1oc2PF02N5/IIsLiS4bgKi7RFGqgGJmyy2yRsxXpf
         Pv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581450; x=1772186250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td/GyC2H54TSnBsbZynZSNK0FkJDWvK5rVS04DwJxtU=;
        b=prC1iQ1eEfxKfyjTXyxaRUt8v6q+t8YJCUawwHGJh/spzIRS+gnVRRpZ1l4OJSz97R
         +wl77rgoNEyF42F3Q33b9J0VctXLnVp++34KxkN7tkKGg5xAausQmTkt5MoU6rWY2/Ie
         2iXwNGEOoHECp7gWPS1oYLVvprUyW3kSLf9mpA2PyfThnDsTMMZycfe3Y5rHEA9P+pyA
         W0NNvdCedUYVnhpCNvjr80UBHF44bqHh46xPYI0zuUE7YCXvCGeEAWPkDXLZxuw6p4um
         dS5hqgY7wjX9ZGLdhmjuQIV5NDwm9H7w9CWxdQAElpOAs+eEyZY05HJ+kpMoBrR2+jLW
         6VWg==
X-Forwarded-Encrypted: i=1; AJvYcCU/EXCKztSn9htBdoR9LrFcb+UiZLYMpbZLjz2OqYvrcsT55xuaz7lngX9DTC+1NsixvHJYwHJxpL3/OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmFu+GRN+R330GMT0ZLrqDVrYYJ4rr4r3IVKdD+ljo081ZgtML
	ORmDTN6f4PcfW4Qk7Y9IEIJ4PdIdFZT7Wc6xKeom9oEPzIJRXFBJADUoBxtWoFHMSK5fx85me7p
	P2d36M94Bu5+g0E5nrTTscHgEpWuCBAjC7gLItEDeCbu860yS/H3ZyQm+timdzVaQ4A==
X-Gm-Gg: AZuq6aIHoreUFy+xYCA5YLHbkZiqwHv/IGX9v50MdukghxpJaRRajNHS4TAJFxzJSYO
	CWyCO9sNAvfZylOamfx4vIVBCJLngzaep0rIEHtzyZMRdQwsrR9GLYQSLIFqobuBPo/k9v2PzU8
	Df5So989kd29d76I63MItCOojdac2KKpHFlGjBqvU7i1CWOSeCu/1geTJlACZOHGobu0WnpRaCG
	3A53dyt7NPXFptpjUGwl3XwHJ+d2JOveFtKokc/5tjxBBVIrZfUShEdqFXRw0Mvoc+1cQm/fBw/
	+R7V+Ffsyy7aMzPNfSqMvdF/3NcRsrjamSOdRetfnJy+Vlh9lPx7hSQfKpLnMULbaxZdw0PDtY0
	28KvxiLwo2jjCsc0nMw64zQGlUatx7rswPYJuy+5A2T+Wcta1NYkdTdbE0DW67a5LUNarYqyrIs
	LDLPA=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2408609485a.1.1771581449637;
        Fri, 20 Feb 2026 01:57:29 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2408606885a.1.1771581449214;
        Fri, 20 Feb 2026 01:57:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d95bsm661300166b.7.2026.02.20.01.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:57:28 -0800 (PST)
Message-ID: <cf9c3543-e3ff-4ce0-8fe2-942a478dee4d@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:57:25 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
To: Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron
 <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hansg@kernel.org>, Jens Reidel <adrian@mainlining.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-4-fe34ed4ea851@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220-bat-temp-adc-v2-4-fe34ed4ea851@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX2ffLXim406o7
 kdGJAsDU99i4Ys612hwjCBrkCtAD2iQbJT9XjTd9g4arzbfigRTUkErLO3tMm+/396lk2BnfRFT
 xuEZIacWULxUA2O8gF/mdHEp1q0oOKk4qBMqFBB1H9RCo29XNEyJuMH1i4uT1B1U//P32QX4abg
 SX2cq0w/KDkL2jjiwmAmpk1kBj5mwJLZ9QeSTKciRWUCxDHwGNBjFYc2Qi2zxQHKukwg1siTFsG
 CLDTXoOpJ0eVBn2zc5nDuqnNECBjGQW9SzyKiJuZFvPtrLcUPeNJO4KqGS0ZjNpCy3w+mykE/xV
 wuWPVP37v/Eu8HE+a/SYntWnWavp4AWvF0q9STx/1fRBN9cyReUPJ1dYDOPxytGxHwU3iintC8K
 xkvZIVuYhriZ7inMm9tsRR99M/TPySRukUsE6KVrYpbKaqnrMEPg9Aqp6n0BvM1q2+JVrYgyJ8B
 ONc0uGUAPfS2KK8qqww==
X-Proofpoint-ORIG-GUID: DQU9reMBwtOtrXPUeDZ33UDMmJ2yrrsd
X-Authority-Analysis: v=2.4 cv=Sbj6t/Ru c=1 sm=1 tr=0 ts=6998300a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ZSlsbEq598atbnW4AL0A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: DQU9reMBwtOtrXPUeDZ33UDMmJ2yrrsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200086

On 2/20/26 10:19 AM, Luca Weiss wrote:
> Add the definition for these ADC channels to the PM7250B definition.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
