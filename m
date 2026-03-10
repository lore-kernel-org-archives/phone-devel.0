Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647572C15B5
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149188; cv=none; b=tTCDt7NbSdp7C+dKr6Yb6uBgsY1Pnm947MBCSvKvH4z3FAq6KwrCfi/YIOSOCJ/Lm2oHVBBGVlNCCYBD8SZYJs3w6BdcWgLNSkA8mn2Uq4Kg46KUBaGzAfL6Qo/BLWtdHR272JlXjVpmKZPKizZAmanm9/phE8+zsYCX8Y8O2nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149188; c=relaxed/simple;
	bh=U+HgIi4bJzREOY5i1XwMWYogQDNt8n9oOlbmK5Ejb+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I96169BnVe0eO5Ek/4GQ6fyTkevA1ZXE9x74x7kTsqTHb+xOqdZqP5Uy6Jy8zJSvxexZ38bwSbWZSF8I+KLdcahDqqyWK9zx+XLRR3iELD3r06kvO4yTzT9p2fEZmlXk7pqVUMLW9IZgKf3f6WLWNDQVDV5n0sthOaf4g7smj2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZsN9zYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXoXl8cA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZsN9zYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXoXl8cA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaSvK3759039
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=; b=NZsN9zYBKfmBq6k0
	3e4yIzAYCoQJK9NRoN4/f6hpQVMIOyW9zUsz1bxf9r1hhghdEIU9Cbeyseo6RVx9
	U1Z7KpiOtZKg8px/sDrqkbBTrCmDxaaqNoUlD6ZVw7bG1yXx9QwXbN9Ra7PF4KGg
	mzxc3O6+6sND8uCtubLmoHgNtXlxlx2yajoYa70yFXhGgyMi5XNqcWn6iKFVtcMW
	p4oTG/QoXlrAplSXlfy2hGi2ekcjz85UTIrx4b0UJV6Z4qwFGO0O/7fA22hAxwsp
	6PdKXQUvL6u84lrl3G3ULp7uW9srLfHQgSWM77atv1mMlqQhD6ZEyEruyaV+i8kQ
	EhymXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ug6yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 13:26:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd90958f24so80321585a.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149186; x=1773753986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=;
        b=hXoXl8cA1uNx3ank/bG2jzzRRl1nZa3fPtJwMGtDIvsOXg2vUMtMCgEwQ00HKuYd2Q
         VU1OCKG0nEv8w+1nd2kIYbaDvhiL0WQmO4rQSNovAKUSNjDSv8Ec4lEQmwSzRPVyw7ik
         i16OFDLQh4VKJFiU3llk4dM0ZZI5lTPVOJeNwklBlgunIHk1M48+zkxyajSVVjtLRLly
         HKpUN2y9pGc7h2sTStWIICllK582MhM4Xr/HzD8XV4bnTnQRsH7pLRNTHJuA3XKiVC6E
         d3PUjzBDgQorRwgu3vfBNq16Ahnox3ek9msO9BNix7/mw4OmeW+DsKf9aOzRB4wR4Rx4
         ZYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149186; x=1773753986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=;
        b=uIgFl9Xa9jaEjJC6MyLCp1KJ2IMS1osotz5IWnhfhJBSodXq8v/SyfzplzMwTawusQ
         yNguh3fRzmh8LYznSAOZ0W1m8Ya8qZH4DbS8Errcy0roBOO2EJVqrf/dTZWF4xf/KUiU
         jmoQ4258IRI3CHWsSDNquXrnUVHZPBMr4T/FrEKPljtmXfkpOqoWidDZF4ohgmq/MDmv
         qjuC9aEtfbZdJy8z+EhNoQP04D/zdpUC74pYSWn2o7P9qXGDW4uCBY5BZdK2yft57zIE
         l6ClK2YahpTQIX2OctR6eXE6RZo+FzDKVSjcwILF2Dt8kxO2hosbPVG6E9nR9gFADnyA
         XWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAZr8vsnl54JKYYQi1xVDgAWPWz60JETyD16sZHqZjWaMxjZQKqeCyGUcuYFR7/jfWh0PiJ4a7vCjuJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/lxSVsdS9hoKRYsWDl2WpS3mc1UMRb5DUlAfypqk2O7c2xEc
	ooQFkXTqt2nDcsxCT+/+g564RsiEONGPT6mkz9ZsfRbsNbYHQuhdR1XF0WOzjKrUCWmqfd/pX8d
	U8FiLwfNiqcqSSAFRr83MbYpWRfQ2Iy7SFCYwaLYCL0WqxEEwajLG9W9Qn/4BNWpbMg==
X-Gm-Gg: ATEYQzzCSUlSgE6JI0RuaWyB9CfDluh/7pTFGC4Jw9W6+WxFZbl1wFsuNEwoeceXpbN
	so7XfUSexrWlkBG6JxfUhXWevuGaDzB0+l5ijO1D4jIvTGFl6NqxUWDrsEfCWpIpJv3nS+zZyy5
	bmh5Wyz4kyB2opqt0pYQq7bc0O4i06OricZpeskpj3Cx3avPAkfdbIKd7BAoZ+m1IHEqZPMrm1Q
	PqepYrmq0o0hYKnuOqLbslmMAQ614yRRyA6Q5dMY8axkSvkghjRxaTmGVvYyDNZm2Bhca5YavzG
	uNHwkTrXUKYe0mtSfv17HBxbZbjh5tgXeL4DWamAYekMEsIdr3WBKTyNb4W+shTVl9+i0zHjqPh
	V1aYcGf31/1aAh3gap0zJjRB21jPLf5G4fdX6XpfsbQmjUNVICDYsn+5m47YteZsHrzcE35lXpw
	mVPQM=
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr799714085a.3.1773149185706;
        Tue, 10 Mar 2026 06:26:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr799710685a.3.1773149185155;
        Tue, 10 Mar 2026 06:26:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3f5ed41sm4208787a12.14.2026.03.10.06.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:26:23 -0700 (PDT)
Message-ID: <d6609992-e319-4758-a24b-688259b473b4@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:26:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Add support for Fillmore rpmh clocks
To: Aelin Reidel <aelin@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@mainlining.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g3Ek2QOz3wqn4PxVIUa-8qW2usxniyeu
X-Proofpoint-GUID: g3Ek2QOz3wqn4PxVIUa-8qW2usxniyeu
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b01c02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=PNJmjveSQSdRINGQNJ8A:9 a=QEXdDO2ut3YA:10
 a=KpimXkPlJ-4A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfXyVpy98QmlH9P
 ZmSoP7fOUepa0o8MRzkIrWSriP+Ahe8LNY4EGUR1UCXo2fEPfeujvGf/JUs5aFm0uUkKVY8gesc
 zqfPT4Mlpa2O1/RvdzKKqJyAGOe8N6IqBqiEhThaEKR7G0rg+wiiIBfJunN7BRX4ymUPgak8MUv
 UgMvXIXrC5MDzMnSUCvIfN7Rptydi9qaHsrRuurvLjquMPCft5ts27QI8Uh2EtmuaYLjM8gp/Wp
 8o7YUePRpygRC2hf4elE9lmTRavYggfIq0e8BPF8tGubNJoh3gXlghj3Oca4JJbaL1VXf/hANbQ
 O4UG/AFSVDzUFWBZzBQmM4SpNUZ+NcrH+0Nb3vgoH1gnC0ObnTGQt7lMB0v/OiRn573dn/nDoJH
 /O4hqF1l8BgkXN5ICRg7euf27y3Jg0hjzLGd1KRVFnPvszmjGEuIigUlXozSqg62mbb/fm2djgf
 RZsNpFqm4eu/40IyZmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100117

On 3/8/26 1:39 AM, Aelin Reidel wrote:
> Add RPMH clock support for the Fillmore SoC to allow enabling/disabling of
> clocks.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
