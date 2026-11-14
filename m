Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667912;
	b=31HtLk46IPlhgfWLyHE1K3AqAVBPPqYewtqq8QO9oxoz48rj8yKtduT16/yJgaXgbwoJ
	 oLKKvfoTumNin4yMBoqQsUBlUnSP6UZhige4skD6wNzFSOYAJSGXq0czwH1iRC9vNG0Iu
	 cnbGochAbsTuzyy25cuCgM9dTco7uaKSF1h1uvpXSuJdwL2ncN/+UCELP/7sGN9iIQLS3
	 YYE1WKHuQ6lbXT4+g97uCC21JazwuOdkMGkLNxXc9ipqAg6dmqIcazZPp10ywcESs/MAW
	 vLSeibfHVM+Hp/IAoWY5p9WVSfus3vGFNXKbDAlH40M3+WTLGLJK2/EOnL1UDE3deKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
	b=ZxEyvp74fqzQq0WiZ0La+YWH37K6xlf7fdSOicniFtR2rGzj+M1QO3Xd9xEZSlhYqtdf
	 qDvvg8yyPpm0fzgMIpix+pkbZG+59nimfeRufHYqP9y1z6Yl42LOD18QVtPFNM/o0gaAT
	 UZU8UWCqcgmgKnka8h1wURbauS6e7BYg+6Lqol/yd69kM3G+HG4+cG4EzZJEt27kCp/r4
	 oheAnPcQJ8eWCv+i2xfHisJbNpFkUSZ3v1wgUJIknNGu4Vvy5qszOxa5orVnBMl/qlaNG
	 /YkvWgqZA4ntWZ66L4j0bzkgDi6qWF+y6MEnW5RgsbAz5MR8EoP3zPyp9LG0RuA314g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cP/y3WfV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F057606A32D
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F057606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cP/y3WfV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBxd177X
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkP2Q2518525
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VM4vHc79k+V21DsCXm9ibSOR
	voSng+h2vl6tYKJCPEQ=; b=cP/y3WfVHHAWw346QA1QJx40/eYMAkSFZFVTchG3
	BUUHKFkcs96k+R7KTGjl1lp/cYBbw/7gpGL4Gi2iKY/zNrKebpSQEvnydZvOEykr
	mv6YXQKSGRRSIBNnvTRHbtk7Z/Ap26GJhju76LlGkhdpgizLyNMMYUkzLML/y5RO
	G5SW7IkhSNPyrOem68iOHkO60MDsqspFsWv4mzDz18JyRqxCPnJkwK3dM4mMo75y
	bFZas0zZ1PU5Mm1HeKgoPsF4711TP/wXoAGUoBOZuC3do/056vAg4oBF+vowxIy1
	pBxGdU0GEypIIlvZFMGf6UkoKriTbIQjCwFGvREFTlJlxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc8yut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so443779685a.0
        for <phone-devel@vger.kernel.org>; Sat, 14 Nov 2026 06:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667911; x=1795272711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=WBxd177XnfjLfFDeDH5I776Fl+30W2Bs5SS1kifemAGoszOx9CF4dJymxhTyure9sy
         wgaa0nViyU/zfclGzhwn6ao1CEq7GXfGNdZddrRWjo1ADYFowkOtgdTLys5zMp0QC01S
         i0tP4pF+2t7XK08d7AP4mXOLf4cmfg3T/XdurPcSUQDNH22GPCKJBN5dw5aVa9iSYGR/
         WluHNKOzep5EsguiJwmFXKVr5emp6zxgKsdGaLSTAsGPpycxJYLp54L+7UQv2P6y4LgK
         4VKd763oQ0MYbDYynA9G53TSScEwdRef/OFcBZVdqRw86DBdQxUwP5JfCzHQHQJ8Sk/L
         HN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667911; x=1795272711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VM4vHc79k+V21DsCXm9ibSORvoSng+h2vl6tYKJCPEQ=;
        b=ojVHmw7LeL7K9Ik8s/sdQtX0gVi15IqT6Lj0ebA9yICPilL7rA0keoPBpe5FaHZq+H
         p7lgdswkts7gL07Lkg9wnscD01WY0Q4XDXa1FgGIbEXlL29NP1GK/Ngd5QT5FnQmkNu0
         XMXfuZjB81hwxGL23MMRfttctSWfEwIDGsASYIgFcjsb5LqJumBZ+K9lTeQ0TS/d9op7
         PoYEpFuXHQyOFg1jZho0KBQC6Ba8VxFS7RmPHtFRWOvNSF2Qlczn8XjNShaRPR9gsu5N
         snVm/h0CRrJSXD7IdLeBoCnB4+tClAsi2Z9r+l68uZPL4BgOcacV4I70GZDa6Wzym32y
         TrhQ==
X-Forwarded-Encrypted: i=1; AL+hErHV6nbwKd72HIQUlmNgi1yRsKxazlLs0IqLYhU41juPY+XbIDdLdQsMF39AlvN5HxWnDagREAQbEtqybQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+IUZufUQSn06U9oyQDaIX+OSbg2P3JpfUqaYrVw9NGJIMi2LW8
	7FBfmTopaHywZE8qBnmKX3OkAiVLnwgn7+O83pYpD/4meG0kzyPQLyPHxMHEEpOQBadwTWuvY2c
	OmEbm+kjRul04eLOAUVMsl5KwGQz4NHm19KxxAIHJWleeOmDnQ5uxZ6jgyKfoa0SgZw==
X-Gm-Gg: AYBFou1n0CpER3e1PJkQq1o2h/B4UzkMU/AdyXi8294YiaatR3Mg9eeRhY9WRlT+OR4
	ecK9n/0mNdaV5bA0KRX4TQqMrEfeQbGn+9ABgd/QhD+Fnr/NNzBxJ0xEucwPAouPEqYz2I47GzL
	euOhErQZ+Ziui2jnU+d8RZlNEtvaYZpzx3TMZSEObgj38yjXWG/nVUwON0bojZM25VZn+WmcCou
	J0IIoZ95+FI2OgEizg/QLGGRsm5hSWRCcRCsjLPDZFiF9r84XIpYD1RoTbElwETMDPaKOV5FESR
	/87qbPWzY6lrZNZurFa16QJfIvWmKH70P14PgMPqyJ0oWGXejBj1KeaZfH7MhFCcRwDXNWE7N9I
	lqTR5LP1P9URySZbRGUmTmf6lSPYnBAaqLF4VN5FARpcmNtPhKxFHqJjDPrJ/lHcX
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812475785a.50.1794667910596;
        Sat, 14 Nov 2026 06:51:50 -0800 (PST)
X-Received: by 2002:a05:620a:2715:b0:93f:362a:a893 with SMTP id af79cd13be357-9494bc423bbmr812472185a.50.1794667909973;
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm10211991f8f.27.2026.11.14.06.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:49 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
Message-ID: <cokprcupy7yxhjgwpu3ycgm6rpgi5khwkoppxfakvms54kpbnr@hzsrwxiayvjj>
References: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfXxMNb+PKC3hVn
 yWm/MOv2NNXIYGOhBK1LEgl4UlKjD8O2k41Clx+LsSMqWqDJDiQBc531SD/NQTXRh5i9CMgmy/Y
 LoSlp1zL70DrpAsoGOBEd2uI3an7gOc=
X-Proofpoint-ORIG-GUID: Z7TdcPbWVDVPFw5ZurEeIetNkM3i6WcT
X-Proofpoint-GUID: Z7TdcPbWVDVPFw5ZurEeIetNkM3i6WcT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX/gdUeo+bSisq
 Cl49d53/mkHPbu1Pbj9w3L7hkaslEhGo+rY4XX8hSkBnGi96+Q8zLVoattgM9TMcsy7GbE18wJ8
 MZTgxSEyT+LfGyXQmklHiP4RI4TOYWZTH1LoQzQjUpNRwdy9wv2VNviIdY+KWOGGMGHptyP66Bp
 PNRfF5YsbJVCSBjFmFinYbo8bzfirQ8lHD3BQkSMS2MUKGpHJrsJStiQrwHz/t3OtDRe4cGFT1P
 JA6iKNZRE+PrCzzfftbMKFZ+DshVnQcEGUIpRpIHtywiwh13SAhziaaQfXLiC5NnZrJ9b2/7cHL
 x9XHM+HCgn6hExYdBXlqXu55d+xD0TksJImjdLYcrhavpUvqBWGOPvwmC+EpO4xmKiLe7DHSTeN
 ceEnEpTUoLSCHyfMHRv6Y7vRHmOfBQnDkCsuRiFuhT1qTiTUqJ65TI3PGfOtqwsau03ifAxGAxG
 dwkZsz416CqTzP/zXDg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af87587 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=rhqQhfuC2zV-thtKVLMA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 15:52:23, Luca Weiss wrote:
> Configure the firmware-name and enable Iris so that hardware-accelerated
> video decoding & encoding works.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
