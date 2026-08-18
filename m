Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4615472F7A
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787057455; cv=none; b=VXHCpZYyVoRzfRsYd0giVKCZsePgRS+S3RnKl3aWzZhaofp5LkGPzf9QSvego0T/PVTuCDE26BwYWxRzfkbZ3ypFly6ZCJbe4Yo+tVQgei1cnnr3gy13ywxTJnARHllEFpFKByFIKoQv9x3jhdKC3EofY5pY468MHZifcgb9QUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787057455; c=relaxed/simple;
	bh=9UJP0+UnLhNHthhnuhnSoK+fMhRJRgf6rxK9n9XSqLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZXkeuBJlJcrmNMCh1PfdDmd6SZqBuiu5c2u5gHbAUPgFJ6ZJhcdlL7uH1b54s/bkhNN44w+wPHi5XjNfB6Zl2zJD+P0CShYdvKFpK7z3qa/gH22HCMet364gaywbWTuTUKHN1qndP/8iaVLeAm7wJIoj0Hm41s0Xfl4HxjjQ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5HJDyHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5QMnbsh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5HJDyHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5QMnbsh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABJ4O2057047
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hLfzkQULc5AeeCQ0RZxw/94NH4NiKad2ELWqLQgObE=; b=V5HJDyHM1Q9khnxu
	N1nhPlxx5Q9glIy0voaF65Gt+8Ww/mZ9MCYR9hUybrpVlfQBbtw1cudIFAddnOiU
	Zq6eiOgAe2/UDQ8dVmskJSsZmb5zfNr02UdiANc6CtzWhTlrvAoWCne6HIJZCT0P
	Yp8Beg93Zmyp3flBJOkw9BDu/eWWR2gDPilxAILg6jkXSEiBOhmhsd1cDjf1lg9Y
	QW7xaCRkN2aGGko0z/3VAv9/cE6thBAjzhu+4r/yo813dPdLFLjUOSA4/zRssbRV
	6Dou7itgtNGogf7IVnzfxTI2bf37K1IA2Gmk0jtEhb2b9NWd0PvH+sE5eic7VBNF
	8Et9oQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmt56s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 12:50:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so8483486d6.2
        for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787057448; x=1787662248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hLfzkQULc5AeeCQ0RZxw/94NH4NiKad2ELWqLQgObE=;
        b=A5QMnbshqwe4hkQ6pIzCuH75oFh4+RlgWQ7OkYU4IvFuoDhZ8FAjcJIYdD7CTvS80E
         bhscWnWkhVhmUYBR7CFlrVbJKU4Hx2MM3jD4DViiVcUbDV9dfHvHwtshK5iW8VXNyrJ+
         jLjh17miUL0nqxbDlybDxmMJCqru5518yYSvBll4ul4ujQ6XEn5dcSQpYD+oa/XAK8/m
         daBRNGlkGyRn8fkjv429ZGP2aOCNMUnnhk13QN8duIQqIMzoDN09VmwFFMB+0Sr/GFi/
         QKTJDODHsjxqMRmiTl/ow0M4NzKRsEAyDXwolX1BLbg4VS3/Ts+olETFe57XuKsYky01
         oUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057448; x=1787662248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hLfzkQULc5AeeCQ0RZxw/94NH4NiKad2ELWqLQgObE=;
        b=C1Gmsy8BtPi/Bu/QjWDJ2oYiOO6aCIDjmIba8/uHdOHTDKkWPDJDWZU8H9lCefJcvq
         gSNpFkJSh6+v1YpETL4UndQ+n69gsLRtda6EMOIf4zLJtRJltwPkGZ2SkkPOsqGanx6y
         Bk34Skjlrs5EvJHoDugq+h4xoh9Qahpy1Ahy6uXSRPRZ0YGOkyCzy2mvA4MEL8Kwxubc
         wHvdS14a9gMWMBu3GUPNO7W0B225PI25rqizGbWWZ607OtT5o4UMTRM9z9yhlWYZZLSm
         1hCjww9j4zGrI5f4G/No3sY/QKeCFX0eJHE24HAizfzdoVd/uci1KfpKNDoQ6JQGKQAF
         CRyw==
X-Forwarded-Encrypted: i=1; AHgh+RqYJ1XTFKGGm1ymnmeIektim9L/jqlTTnbedzLhe65c1yms0o/jMjvQiQ/nAwmwRSE5Ju+XzRnh+skM2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQvfDkxiasOtVChG7nTARBRXxCUPUYftlKzodA/OPXqvNxq9e
	FU6j4ER8yLLT49HMNLUJgdZ39GlCdXmD0eATtviub+99aG+yH14HMvYUYoefC/LXaPfqxXOFVG2
	fYZEwhCAFCg3L2C79SGAwmzBK93ly19p8tcOZmReuhqLig3UFeMKC71bHNH5tS/ISkQ==
X-Gm-Gg: AR+sD138KMAqQN/UWPi1MI7Mv04HWl+tfxQNbmyoQCG5+8ChxvzQXxoiGeO+jXocPsc
	smOGIup7N/4V6Cd3o+kCOhvpIrYJDdEDFQlLe2Mf+8e6qvj4Mn4URCjoU+6oakvUvPF4V0o9UvP
	MXaJmBPn02ZixwPv6Slk+DFJeCp8Cad20hmVa0LqoK/0uxOBwBKpmclPijfcTidfUYV8iImM7Ao
	Pbi3uhy2GJ7NxTkJ3Nw7VwGvgtV7U6Yn+hVCpYO+D2DqGxseBUYxh6MpngT9TyvQlwFZcFc/N9e
	ocB4QJnIxaDiGQg9rZ1pWAo3V4ibV9VcqyCPlKsDld8Oo4aj4O7RGv8sq5H9bJ36E9g6K/kJogn
	WA58A3f1ztbNz4pJpaVu+fi3a
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr243319901cf.3.1787057447602;
        Tue, 18 Aug 2026 05:50:47 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr243319601cf.3.1787057447138;
        Tue, 18 Aug 2026 05:50:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm152538566b.50.2026.08.18.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:50:46 -0700 (PDT)
Message-ID: <84be0a35-b088-4ab2-9111-80809d6d2d53@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: match downstream DEF_ACT_CHAN
 encoding
To: casey@samaritansolutions.net, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260807-slimbus-def-act-chan-v1-1-fd542efb3d30@samaritansolutions.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807-slimbus-def-act-chan-v1-1-fd542efb3d30@samaritansolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NCBTYWx0ZWRfX53HDuwnya/Wh
 fO3/8MV6ea/VCImRmj8AChQS20ylqGT3RipvTAr5dEuKVUF5I/I5GswK5N88hNStxp5VAS2FCTj
 USZQaVqOw9MDPiWqB0ctC4tO/RgVC2uyTJmsyVzmbdSwICytIBFwn2JRNiLTG80bsChECGf1i0f
 4UfJiGl1WTlWOYY1suwCeUyL8ftAsAau3cLvIWo0D6q8aytNGfbKXMAtV0oHrLurRwquGaaknJz
 M4Xlee7JPBiOWINpokJonZBUtoH3Mn1IS0B0xgaQIQK5ZQHO8005RYQZxwHM5JM71NOzxzUfrw4
 h3jGVInIvGbnSyAD8BDFpQOOJD1Y3McKi+to+1ycWihcHIrIIVCgTmH3SqiKcuBvJrRFjlzNhDL
 Cwj21VYjuYdi169keMCzN0bABRUZJYXDNizVuYIqtojOBArwA5glBV/xTSHG9/XvyfwbPQsK6Xj
 pmAGKhrzwi3EuJwIbSw==
X-Proofpoint-GUID: TexUQuhKGzWHIjAKhB-EwzFU8oOE7KUo
X-Proofpoint-ORIG-GUID: TexUQuhKGzWHIjAKhB-EwzFU8oOE7KUo
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a845528 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=oRWL8vWFAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7S0yl7ldlo6rjceDY6AA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ZSzuMzu-C871e8vGMv2q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NCBTYWx0ZWRfXz3JZPZJcoY8J
 Lay81u/zIZgUqot9TNBXnqGBPh5i4KKtWWwahJ5aM6bADhTTA1oSZ/oYD2i3O69MSfPJUk6oJKZ
 NO/sOk6vE1FmhxXS19oCV9X/KXMQIaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180094

On 8/8/26 2:35 AM, Casey Tunturi via B4 Relay wrote:
> From: Casey Tunturi <casey@samaritansolutions.net>
> 
> During my investigations, and some rather incessant cross-checking of
> blueline's SLIMbus path, I found that Qualcomm's downstream driver
> packs the first DEF_ACT_CHAN byte differently from mainline. Bits [7:5]
> hold the data format; bits [4:0] hold the five-bit client number.
> 
> I changed ours to match. It made no immediate difference on my own
> hardware: blueline's current values produce 0x0f either way. The
> downstream layout is correct and should help devices that use upper
> logical-address bits or a non-zero data format.
> 
> Fixes: 52490169cddf ("slimbus: ngd: add stream support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Casey Tunturi <casey@samaritansolutions.net>
> ---

The semantics match, I don't know what side effects that may uncover

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
