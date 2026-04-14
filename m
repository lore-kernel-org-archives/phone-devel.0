Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B7F38C41E
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154088; cv=none; b=McHqydGAPYow4Tv8xhMbaaVykmUKWwwmnduQ7lOcqFHqfo8PW3Ui8hSMgVXWubUvg++Y4LYTib+AxMTO8gbqVjbATJwX/DIFxr3OIDZElc0uCf3+zF6HrjgT/NQFRkgoFVovbGmGh9mh3d87wpvG0a5Ur38E2WFTXdxC5uGQfO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154088; c=relaxed/simple;
	bh=+na2rETZY3PhgUgP2f4aP6B+WxxI3R8eOMpOE0i2NN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEklaaRkr6r/gT0BYM6lwdwnTu3s+fIyDFuxlyqzJ/euNiZo/QWEPSHRBkdlZeAMLMlO0/UeA3jH+Sf3dRlP/fZqJlH5wtAEXiF+0hNtD/AHojfgfzNO/BpeB28QinUZZqM9fxj7XFNWYAS9wMoeagr6CSbs+ViZywoH8kYXC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TySy27fE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+Pov0nc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TySy27fE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+Pov0nc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6bKCU3425969
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=; b=TySy27fEX0oJEA5P
	1yGIg6jqDVxYj4yWvcPAjAAr5FFMxkrguuexME0GvhJvCGbNf6AXcjVqu8KaFEZb
	CD0QRpJyokuZcneIS91Azo0VZu3+vDbuxzYzzSpbb5jWB2GNwnS9DTqTdiNt88lW
	Wcc0gODe3myzJV2yDkcU/rI0WAlA2ZUtVsf7DF8DqMD8+4wVjmOg+0CFsKLtWEmZ
	nekXuDSK/Eae6NGcy5RxOCgDpkBzeQD7Bfryuwb7Q6W5oGcVGoHNZtuwTjvDUPBw
	4cTPoTU1kRDm9iFo9/zEmhyzCdh0chPd9hnpJ2GGWC6f5fxQuIM/KrNbndIVHxTI
	KQgTDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87f9qf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 08:08:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so106106485a.3
        for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154085; x=1776758885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=X+Pov0ncPtujRuy5DaUAzgLNC3lVEg07QZTt/fqGUKHKhLlZNJn9PKGt/nFQWz7Dmo
         oz448hK6QlAY/9ND3g9UClZvTeJw6/wW0iwLGg88KGT5tlgFbo9D/SSP6qoxv0HSdIjD
         0u4nz/AKBQ0VrrKlCC+9XHxzyx5LV+g7UQVzUXCB0um6QC/1Zg0yh5eraXVTTok7s8WH
         Y5U4AUkzgwlzWvaOxnkoIMcIU6Jb3eXhnrkJiwLyDOdz2GhZ3GLPhRYolXoEcZRsuKDT
         bFrnHHHVbGaRehWGwCeAVqV0yNRyzdnkMzwpsQ8fjysZPCcfqrNEp7Jr+BAnj2Z/+4J0
         m0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154085; x=1776758885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Or8e6KVvqN5oLm2ttfPCRCtO9ggnyvfWSveduUn6uCQ=;
        b=MF4IhCACD94mPCDFr6ibTRor0jGXb4hudEeJ5Jm9W8DevVoBdI6N/0qoGpt8kKJi4b
         I30jbKONx0sJu/b2DfM7TuEvgKbkcuUzZVK0qbKGpCACdNv1xtWD24PsOqMd8yhD2MSe
         ezr1b06K867PsAbAs9sl07cW0iuK9gnayrX6G0OfXXOqzc2zX3lcUG/ZV8YpglvCi6cj
         9/eJT9iUJ6URznkC57qxvKHRvMph+5zIYDXvwXCv6N9phectw4xzr5LvouaAtmsc7zjj
         gXjApKMpy0k4yhSWodUpFRArMLfC4HmsE6loBGuixZekqSqAGTceXWMRn/AADmKfYUAT
         IMIA==
X-Forwarded-Encrypted: i=1; AFNElJ9Plk/XdQaKjDwKpyAY5rfslD7qPqo6OLW4SIOmi+FO2HK0NHdbV269VcVHnyAPHy0jigAzWrjVrS6Hsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfkAr3Qzk4EG0MlrRdjogKjhhKIMdr+tqnzSJ0yvo9J4Q27IY0
	HI+sKGhiRVzJurVetQpXhHzzOkPLNxbfVk9zxC+ZyufxArGPIGLOPvgrU2WlhTFWkhPeTKB5IAF
	vmPuYQkxpLB+A2zDLNHNrRy7XLfRGgapNQd+E+0TDf0YzozF6RLFT4gux14jc/z6kBw==
X-Gm-Gg: AeBDievr3I7bZHwBHOUeIzAC11jz31c4VT7O2TxCrZHSTF8t+a9CIM8asql4Jq/0iaF
	azyP4nzQgiNFtaCAiGLqbhEnsKQ4p0O2OyBoLkOQcomJ9mzjvwccXtsFJuZdcp8o47mgjIQu1lI
	gr5w5y4UGzvr7zZVoW9Rq21TDCrOivGgRiPX5J3QGES+h5mrvVFG/S+7fhjfkG7EItzOLYZ1hKg
	bOcYbxybjcAACeUaJI23eRtfAUSDgv74pBXEvae84AZJJmtk2OOOCBwE09K+KLqvUpzQEF4g68e
	BXDSz82h5nie8hr8l9zDYBfjiIlq2s4Qln1mBUrB6F+g4pf0EQQj2/79m2qCfl39Xxan/tR3TGX
	x0+NhdSqxTpuS4V3aiExOuP6hkKtXl+CkySHKkPRPmiXih2Xd9g5ZUMb68zIj0BNTFJpxA9srys
	F5p76x1lPIrNaMNA==
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620677485a.4.1776154085208;
        Tue, 14 Apr 2026 01:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8ddeb1cfaf4mr1620675885a.4.1776154084770;
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670eb258a99sm1899153a12.15.2026.04.14.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:08:04 -0700 (PDT)
Message-ID: <677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:08:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: clk-rpm: add msm8960 compatible
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-4-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfX5Nf8EACM5Agx
 QS/Qzpd94I1IE/197rsNvvVi/KQAOu07RTYQ89rBH9VWsnZs4eQNb31HovwNIZzGeHGdYpxQ5Qe
 RtqzvIry82I4dd6lLUUseEp8nYsc4aBZzctVZ61wKiChYTMCJw1I7C/3Svc2a0405HKZfkt6nx4
 FhN6kNy6fAZjHnVQVr6GMI6jtfNckiqS1fl319mNQz3zYs0LMdEWkz39W0hgCLBYBa+8pNgtaRa
 AEg3GqAhmCbPSVRs6YQR43BnqO1aWRMVJJMlOQTnZT4/hHVMXL6/04lFxlE0GQvuQhLNYvaozKt
 yaDtKYpzMXiHjzaESjUjRMSZQ8/K2wptQPqCLaIFyR8f54Sj4tEoc6xby5mUSjoD4Tt+NHk3+uN
 3NHkwuXytJJXJBZyOuCQrSv8yWdlMo53eTHmzvBD5sGg8PXAHmTdCVGTXwV2POVUMBMoS6Fj2vf
 cxf6l4hCaH8eLGgk1mA==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69ddf5e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: mIB3_GZ8RoeKT4kO11Fo5y1O9SAbPOVm
X-Proofpoint-ORIG-GUID: mIB3_GZ8RoeKT4kO11Fo5y1O9SAbPOVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140075

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

This suggests a fallback compatible could be fitting

Konrad
