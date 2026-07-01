Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4B3F0AB7
	for <phone-devel@vger.kernel.org>; Wed,  1 Jul 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895877; cv=none; b=I1JQsCUOqKCvu1BrJ19WXX4dcjI/1xJwHBLAv83pUjE4RrBIOdh/A45AtvYI7FeEqYppjRhgaVMddArjbMpsdD+j2dX789j0+lOUPmgOY8hMsU6E1UHjIzeSxoY4ZtbzTnzKmR2nzDUf+uER3xjTw82JDDiOBFSyD28Ace48AaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895877; c=relaxed/simple;
	bh=/6Hbmv+j5VVz2Qew1mwOKDUOPfWnD5Hc/1yxo36gb+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSI5gfynDEs/XDPy9on/B20OpCX2dWJqKI9b9WgAjaNcdJdv9DXtOv6S96VLi3BAttX75Vcn5+hLO4hEtY234+ufuAiqzVUe/IAEeSy/+QqUmlyTXjVptb9dH9goWx3no5jY5r2DNq8YWsrBcea13pDWzD3ptkW5zykemtna6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnK8ycWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVHFiA0w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnK8ycWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVHFiA0w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GDBV411099
	for <phone-devel@vger.kernel.org>; Wed, 1 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=; b=PnK8ycWKXte09IQw
	jrfNKEQ7sygq33L2R9J0L+A1wzdEq8TFqZ0HWzG8KRzyX/sKoIIIxlfBpxDUOdTm
	RFUNAhaw3/Vyv9sbkgGIZr1Ykaq18LO5lnRJLPieDEteTfdxw/3Kop3f9iPGYzpd
	q2Ou0DxmSH0SdWpgMDS7KUXcvVM+0RLI1HEDSkFBxMXO0XQuXCx5bPOiiM3MA9po
	IQggs7kCJhca8/9pIT7tbgSxLjuWbEZ1o7KcLiY4TZtvUrbwM6bBRGFzfou630EX
	2NxKIhBpkdu8Ueapo94RaRggB9qc3wNYMVFHymOE1KptwAPGklBuWDpYhdazK/Qm
	CAp9lQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfybpfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f015665cdfso994556d6.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895874; x=1783500674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=;
        b=aVHFiA0woSw1PBe1YpTiFbQTv7AK+TfS4pyE/mPQiqooFHKfOw5OyRReF/e51A0OcE
         jk9BhEVgvKsFPRWq56abLhVydxDtZrTaIuCKE5F4+ooBYS3jJcDlndVGKW17cmPiQa+X
         l2V1g1VLoQgavbcUkPqVIXOeIB5xDGvIwiujeX8CapTamZvwQT+USFq7YdgLu+w746Pm
         Ml5xOTvBjmQGRAq3OPGbNJ3cYtMVVdV0hDQ/H4EyGtS0DyVxc9MXpOdtw9wFhRWX5Qv3
         dLsXlbKfV6lY8RZKaWI5VxXK77bX7WxJS8dnyal6FxELGHM5pGlyQITvRsDZWsdkogdj
         1RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895874; x=1783500674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=;
        b=iguRb+ji2ncsEqEes6F4hY2EJXa2LJbA1UpJ+HAKuJ58R3KHmdSvs0N/Dpgzkhpe9j
         NKwHuMjjCgaOV/ZT8decjJ0XBHqzUuFSUh8s5eGrhtL0wHNcDF/keCj6V7G5pXQtDexr
         s11ya+eCqBcGnO9b5fVL3PehJM4myCsDTRNn22TaZMv+WHLPif4/mQ81q1tTj5OPaaSU
         WMYiidl8T8g1CEnBagbUDfBXH6z20HRpmwuo0XIQxjMKn77ii5vCa3PTiAu3OtTyyfV2
         YEBUMa3W7VVdngTi9uFoGMsFCXHvUP4K0KdXqhMRtihHdnYZ4mgmBHxrJK732yrXo+XB
         rESQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5sqv7n+74kKPS3dpGClCbpnXFrz5l4Xjxk9zCpCHX8KksE7ZOiuEg8l6yP8ZcMZ0HKNeln3cu6uW1Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTI3+Y4867PlhBt1lJc6ERJpqy4QNdzlRT/pyAxRtApfQYtN1X
	8S9slxZoMhAAPyNlaFxzslhidAAt/xmIuSGnQDujpzddRhCGhqoihRve5QrZima+IUP0i3I+TJ9
	4GF/h7Y3fVecuprfXzItNXQ1RVXapo0uqpZoatCe668tu32vPqWfPwPYOKnmiBryvKg==
X-Gm-Gg: AfdE7cmxNgikE1vif5AThCwMC7UWs15TzXpsmOB5Y6nGVFIKCL35bKXWvjcgebFLX6z
	RSq3YoBE0+LNY3yPdbVZ4p5RoJjMAymbNrSUzOjapQwsPzccG30TNC5FKEqo6mysVSrbfzG3xbc
	jDLQu/ELCKFgcekVQDbzzPLwlNOsFqohtiq6WzfxG8vCTDO4+TxGbSbSQjmOHSVBn+QkHGZ2qcC
	PqaVgcYS8fV/x8njFDq5EoLWaTLu1D8/SVyXcQiXmcpV2UgRih+1t6IzKzWq8OTwhmISh/ed1XM
	N4ptWyGCyTdnFpDLkv/akxmWPrn2rKQ8jPfcNGmU+IRfrqHLgEzqub+jrLPgLRRYcjpXlG4s0bB
	4z8+6zUqdKJ1Fs1nJCh2j6zlSt9+2Y6RS40o=
X-Received: by 2002:a05:6214:5005:b0:8f2:7e8d:eed9 with SMTP id 6a1803df08f44-8f3c94d80f5mr4647746d6.9.1782895874005;
        Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
X-Received: by 2002:a05:6214:5005:b0:8f2:7e8d:eed9 with SMTP id 6a1803df08f44-8f3c94d80f5mr4647586d6.9.1782895873602;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6988270903fsm1829565a12.11.2026.07.01.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
Message-ID: <8d9b045d-edf1-47e2-bc46-202686cc680b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:51:09 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44d502 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=XN7p8K0ll9WvaQOQMdIA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 2eujlKvf3EvIwwaCGAiMBFi4HZpNInJ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX+O7QB3qXlXFb
 2Da/UnSkvkLztQ9vFYJPDWuYRFYThTL0aceCj0ggZyxFnKULrTiCCcSctMCQ+UE7wZ+AOsKQVjp
 9+JLf1/DSLy3Vy82vyDlHdEc/bK57I4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX/VgWOLw0T1DU
 u2/YnQb0AbCkOzHX+nn65S9F/+QjBzkNcLUfPa7jtZP8YtTrM7YE7U4zLMs5Vn8ZzhmKfPeicQy
 kXFkpM/ZWmo+pM9MX9tIVTQk4bST01J3/S0Ia1nYUMJ9jjb9l4BqT6/JlRw+CTLJWrkKKq8G5W5
 FU7tIXTVKB9IZQWBbqvPgi1008UvXMJc/JsOCGMYF/yMb8Z24tz18ApB1Pzuf2Q9h7b6bggVS0i
 UPx4eP4E3Xg5+scZcFpQzSGjHn09rkR35LdSjqzlcLMoU0fbYmnyC/9QwO5wy44VUdYLI7dgCQG
 Q4Qh7bcQ9JMu8yFQBm81OyQ4gebT6Qpp+F+cVpx8AjAdSP7sMgn8OU8UDdVS5C1/j9eoQAXEWms
 DibnFbQMXtZbI7RlDEEutUwqm+G0CH+ipJX4Y26tdYx+4UEVj/NK9esxF/aOXpU33dJqH+/Wfrk
 5/IxJZfGBeWCev5dzbQ==
X-Proofpoint-GUID: 2eujlKvf3EvIwwaCGAiMBFi4HZpNInJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010090

On 7/1/26 8:19 AM, Luca Weiss wrote:
> All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
> the prompt and help text.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
