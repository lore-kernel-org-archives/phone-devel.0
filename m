Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757693E3DB7
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349517; cv=none; b=bzMUr5R7Dkk36+eTLXidzwqpNoL58zDSKFGy89fQsPqdxLVkae0P0Ob9/qusZay7fuhp7y86iGQ8yZmlbfHA2Z9KU6ddcGEVRAHn80oMxjG0BPmMCduhNjHPSn11pUmqCWf7hWoH0QamfVO9O4nHPDPXkEaS+ofw2Mnxvf3LaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349517; c=relaxed/simple;
	bh=uGwTmKa4v5Dw85aNF7uhD/mce5JoECBrz2IShLy26x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLec7oF4JL5LFusiBLIWBhc9zFkgjR4YqTt5c1J19HXrWT65gQI5wEasPYLcmWPGNtyGJKqKnPr60GhNg2EnoSm5Kxyb57cZVuAaFmlsZSkQBp4i7Tbze0yy8Z8pEqYLAXgXkH97yLyOQoUdjrRFRuYlzQ3ziAovK0E7EllhqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeuqvSy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjICwdaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeuqvSy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjICwdaK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OATn4C1910729
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pD0Hi98G9iC6oDoEHGu63b0DHmtoy8/a4b1bdtIh8ec=; b=GeuqvSy6u8XgWG3f
	REAeZ7yYWhZ1c0ZM57TpwkUQJJVDCribOFSnTLo91pQGKPE7bT07/gtwepd29pEw
	jkZiwwtprrASgLOpCV5Qtf9Ify2Blcxm9YrT+Yf1+e0q+xntxJjxX9dK2erNxP1T
	vx6ZaymawYnTfhi2pKv+tlpfjczWT5pPhtk7j09R++2qaz68by2CGAkvxgmomkb8
	jCyr96WETxzSo4cj2pR4ju6a4DVzggtrFdXv+cMqL9GrEB16k+jpxetqmV7FaxH5
	zVi6+0gZp5W2VjFCZU8TpiFpd8s8oaGfr5oQYdu599uV1f8IZ0VT6S+RYTxQH2o+
	Vj2kSw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyu2hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:51:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a081737bbso60046266d6.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349514; x=1774954314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pD0Hi98G9iC6oDoEHGu63b0DHmtoy8/a4b1bdtIh8ec=;
        b=CjICwdaKIELFkJpy6ffengaUcYJfamC0av91fO9yMT+BOVSzeJnssdfLx7qeRLzgbt
         viOlqkv0QtkHoOc/Kh8d7L5PU5+wYlGTP9K/tZ6dYKp3VIpNopQCucGrCZUXpLLQhIGy
         Kb4QeSFM50mlhB/DkgiKq19DBttkG8ZiuzZVbDuwn+V3dh0qNJL65cCLnJ7hkVypGUlJ
         jBOVHpsFTcbbhWnLq/IxBhFfUDAoEf7jwq4JfOcoCZTy/O+QNxLFwzmYKqH2DqHL7MK4
         pdzekuSoaxEqo1OgAVJJ3vShgDBOLCyfpArGD/7Yq3blAkDBjV9WNukBQSWo5rqzLSXP
         yMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349514; x=1774954314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD0Hi98G9iC6oDoEHGu63b0DHmtoy8/a4b1bdtIh8ec=;
        b=RhrUkUp55UMbHOZoZjzsq1PFhEGtyBsNP74f3rL4I2BdBZqVcCNkeui/UQJzTBbJci
         YOhif2pxnUSjkUuNH1odOWSBvI19pzuNCmUEr3QisIknWU/bC1eXszIx3gYlnhVTGCrj
         sJ9USYFaxvA5FJ2Lpd/+dtKlUX+iMlzWH38elYc0cEO6LiiiTjHcDO1xLVK5wd9cymBk
         1sriQaqo/qqg4koZzwkjllk0wjK1bkUiPGN+JvXsI1v9p989X90/xSNXOJ+QqWMoetpG
         1Oq67O5iMDeP+sjgbXw2bkJYHyVXhXKCbAocl8fbU/rrjy1dxTUgZVlMGco5V2Jck9JX
         pGsA==
X-Forwarded-Encrypted: i=1; AJvYcCU/w8+ACA/X9eqFtaEcZ9L1GYAL0cucjBX2J3ITBIngfDGLz+Na9iGpBvFawJ3s9rE/dVhkIhjnJRzTVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWahC5ajMJReqp3LQ3oOBr7ZHicBvpCL+hjYy38z95cA+TgS8
	TyagZyDu3Naj2b7NwaXvFlVoNmTdWOaXC4SkaTdRyslZXM6LyJ+wR8oSbaP7es3sbrbErzT1K0F
	d61jukFCbaeYAzwwq3NKf7Aq3F1CvYO5VXKX1G9pwKjBy+1QujC/NdULuE91CTnDhQw==
X-Gm-Gg: ATEYQzz0NquVrMWyMFlC4fj1G7xw86AORBTU88SBBsBBxTgL7dXZglJVgKUuLLY/BnQ
	O6XlpFC+vCdGlvwa10X7xGexc7nu1C0Uarr2n5ltJC8wx8tsBxGBwv4ElfjK1HPoqUE2NwELM45
	EOPUmDSUEww5UinDNWu8L6JiTEn3jV6hgjvS4y4a6EKaUHglgcHAjCEQ068LcTt7eluUG1lKqCz
	pD6ZHeHVja8sGiSxCZLXOqTZRkLKKKNtlJvQIo2o7PsrBOnkZWhO1qg8xoQmxQNmm9+ZV3/omN7
	MJNGu6fr0OX8H8vlLljfH1kwAhKrBYhdWkfdomEnL54ueNrAcdMsENaAJU1Zzq5MBmj+2oCUMTL
	c55U5r9WRvGHT89n+fGXpUQ92mtgli4jm/P+mfmOtTeB/jWJuAFvcqwzeHdu5JFWj6BENuc1+6P
	ivAYU=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr194549851cf.1.1774349513866;
        Tue, 24 Mar 2026 03:51:53 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr194549541cf.1.1774349513260;
        Tue, 24 Mar 2026 03:51:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm618765966b.24.2026.03.24.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:51:52 -0700 (PDT)
Message-ID: <76f6f90f-794c-4fd1-80ed-63416626a54d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:51:49 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-7-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-7-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX9dYf9ufQVWki
 Y6EYBoBKHp903aRlz+hzb5QTv2D41/xeP69OGZN/WeeLfkSL4Kxjt2KvZ1HfB1icExHdXQoFbdv
 tTErb+vRmMdn4k2LnGPObQK9A3HYd92TaQaWRx6qTe6NHcBsNBqATAxpoeQS/kzf0QugKDQpnTH
 tXuw3LC0mdX5LqJqgNG8R+34wA2NmrDBzz5zLySwaBcTf7aW14hdtisvj/vAk48d/xhKo0bEduX
 kPSfznGk73lJWDRVhfKyvvM0th90qgeZPh+WtSlpkQtV8JINVW9Q3QNaj2qJg3bitdSnZOkJALA
 r1WJRPaQxrQ+KZ7T3i4fQ26LGLcKYI6JAUk0oiUoUoKZVtildhp7hXOZ3vPep+SntEuQ5JYswX1
 wfVuqDVz9tb8E55B19RtC/jgYBiqiIVSwfbSQMqN/jmbp8xWSwF3ZBj8aK1TZmOJ8dVl0RuWMYj
 f840EVsLOiGdNza9egg==
X-Proofpoint-ORIG-GUID: umK71ZKNnuzMtk93KKtlbWGiXg7Hdxxt
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c26cca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=IQdlk4_VRkkA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: umK71ZKNnuzMtk93KKtlbWGiXg7Hdxxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086

On 3/24/26 3:06 AM, Paul Sajna wrote:
> These regulators are required for the LCD
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
