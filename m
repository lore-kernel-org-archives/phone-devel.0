Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5A20AF87
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052414; cv=none; b=DUvKr0XMZtXRR/9gGosn4vpc7PflBjSdYEqkC0vmaoktM6Y57h4vGTaZN4S2cPZrOf/0+HDqoXGGSLBH/XxePfRKigj+r2ZfWLRd1VIiQLHscwTJx0mgJ2NmRgYUp9KCkLUFJiPePbOkc5aurCWdI+f70KLjkfPEbyRgaAi/6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052414; c=relaxed/simple;
	bh=PgKJBp53dR2Ai67YO4V4HA071loDKNdxLue3b8RIr58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apevyIwB4jxCz7I0L1/OgcQA84ZSFieWyTbwF+O9LNqWZczqhGyhVTnhHeUdXgusvrZDiX34zoqONyDJdhl8ZLxAQGugKpN3PIGOwpcOWyqyaLq9pd1fgmJKYPwDwR1CkTseAhaijhHN5ZTp6brBMkBr8l2fAUP8lrevxEQVyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAvw9ewj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAvw9ewj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCHDDv027611
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 19:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C34ONTM+joY3ACRb//NUdUTbM2c8N4wd1fosaRZcrkY=; b=fAvw9ewj+WXk6hsR
	H7EEKDhYakCtAsWIFBtBE704V+9MVIFwgkjPJ8+ByILnTPMBhoHyLjXHyaSwHHY+
	IHkBisTMnVksCJqHulekIir75GZ2VaWmMqFx1EfJ2Ko5YHW/k85gItEJnRMT/HPX
	Tn2S/HQdebfWS+YHYrbAu5AhqdraMR8jQLpfw1e5VvOpNveO6+rDXIwdWEtnJR5P
	vHUoOfLgbSNXQCBZwaDfnqVcxDryD4X4olYv2DRN9DEbzpK4n3H+IRZPFF3JB26V
	gisA2Amo4581exSBsuQnRAGtivDoI4MC14M95n8FMm1RaQ69rdCzFqmFYmw4pzR5
	AJqAtg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26j8hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 19:26:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so22710585a.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052410; x=1751657210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C34ONTM+joY3ACRb//NUdUTbM2c8N4wd1fosaRZcrkY=;
        b=BJ9DxMZPmhfu6AaBzgPSo/VcCVlx4gbTuF1evkq+Ev6P+M6bew1UswywShGde6tfbn
         XvAHOK0CuCz04BkLcf88CDlh1M+ztrEuBbtfLGIKb1v8v2wkBOVv5gVs4X96u2kPWW6I
         Hyp4tK9aOyQodEMVz3uZMU32BTeNVO0qLvpmfYgfd4N4JnVZtJKEpWTPyItvKDqVqPag
         +KeKfr7RKHdR70kDQCVbyDPkk4Svqq+NwVhoL13HjfyFmC64BkfChaVQv5NZavKwgyV9
         A2RJ4HYmbWFv2B5GkFgVyoyKHcKaoffvgxnSQ4TXjN+6q1JIDrU+wWibHuysR6Rl0ISf
         cJVg==
X-Forwarded-Encrypted: i=1; AJvYcCWpYNKmq/sgZdSauzr0oXXwYTa7tyL5WqchSdLGnAsG9G1/TvuEW5FMM+YXkWc7Iewh5pSWJV8yMy4Wgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUH5n5vjCeiRmv1SVuzSunreSCsdsa68VT0moyuxxglKsmU163
	7S5zeMW269ujn2QNN5pmOrxN5bZds6yBoYmOyAwnkQoEqsYN5lx4994b9bKBsuh6jhbwPi6oRKP
	x3ul/g+43h/kveW0vc1y2+1InmlW1gL7dQYXe3ZNhCnxpeVThNT4LgsVdcOnDED940A==
X-Gm-Gg: ASbGncuePHi9BTQ/bqq/XOpbstH6Rw56h5TDPiCaN0xVdLNxs2ImM56PMB+Cweiyfiv
	LFAAeK7/4G2wArDZ3wc5eHlCjkgxO+cHfWaO9jcYcKtb7RNn+kb45UrVGov0gmGmj1ykw0CkgoY
	n7thR4zy+u0OiGJNPA5oP1isDjmEfpNiYxJ3q8rzpm+3OPA/NlMU9yYi+/xi4euffgHZUTgutWA
	xFTA/N1++ze2YCdthUc4kqaTpyhMi0hBRztAlMLo8q7DTSRdWyPCTykT7/D9HWGw1iVmxJHpLF6
	pq6h2CXqLTBN6jiKDgKCu/SaRpUxly8F/CCA0rUYPe1Jo7KXqcAkwtexY8QyqXTbZLxcj/PRpk2
	hld4=
X-Received: by 2002:a05:620a:4384:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44c21acefmr18328485a.5.1751052410519;
        Fri, 27 Jun 2025 12:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHDPYkLsnmO2nGzNZ10OMjymrNY7J2wqTDz4VWNzNFIV4cSvpU0BqsujQtneyalnxm/ShhOA==
X-Received: by 2002:a05:620a:4384:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44c21acefmr18326485a.5.1751052410034;
        Fri, 27 Jun 2025 12:26:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc2dsm181908766b.136.2025.06.27.12.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 12:26:49 -0700 (PDT)
Message-ID: <18dddd39-6118-4b46-ba07-8304d1830798@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 21:26:46 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: rpmh: Add support for RPMH clocks on
 SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
 <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1NyBTYWx0ZWRfX4IdRVy4pjilz
 lpxL2vuczxBd3UEaEH2F5Z9yBW4s5519e5YqgGv0/YkMxqydb0nA09IpUdB19B8gSGmdII354jI
 1QGTUvVrTwzyJAjC3xikSZzkc6+L9RH1VJUaPLTqokTicZGR3E7RKtDMKvX2g2glIrL475kDvOI
 cN4S/Ntr7x5YiGqZ5LdHUJXv27mgtGQxBsm1bsYHW3ed2WWHxkUMGV3vpDSLwQOgJulFDGYfI+f
 2+fEEkegpRBN9P+haYPYk6WtYatcXsr8NrpStI5dAVwPUfQW6Gg0T4eRdGlxmRt2B3JdjRtnat+
 saLPBQePKx5KSpVddxoSHwpGU9KVHRwikDaedZ8qxnykUkL0m740WQpHGjJHnKr9kMBH2w+GE25
 AJ0kGuL0wdQ4YfOKMeorfscnUJp/TJcWIjIbe6R44xxDdg5+mApYZJOHwHBN0OAFqhsGgP0O
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ef07b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: NNzFfKZC63FZ1lR6mgZNz2sIUmgqhqgf
X-Proofpoint-ORIG-GUID: NNzFfKZC63FZ1lR6mgZNz2sIUmgqhqgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=931 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270157

On 6/25/25 11:12 AM, Luca Weiss wrote:
> Add support for RPMH clocks on SM7635 SoCs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
