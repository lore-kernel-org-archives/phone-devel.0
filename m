Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481645;
	b=NJ37VlGJIALg6G09nncd1jF1VSiw4hlsgVxkQRcOGEdQUxe9B0sUnhNo2wdDKZskdN1J
	 D0e6f096BPwJifWgoMmTE2WbRTdcaejkjEtErxe7EOCWI0jh7SPX6dx31oODdjXDXPuXK
	 vCLG1zHKirGNxw0UbSUnqhxpfjj9KZN8a1EcCZN2fqlzj9eu8j/Iyay2S1qkSoGP7m+39
	 koUq2DYlEBbfwyMigS0NTkvesU52cI0wviI9wYi2dnBTUVoNtIhkipKEPXd41So0KHpAw
	 uWec0XnyFjjmXLYBfr/TDtlNpJk0TceUTm5s1ynElgqFhc5jLkNnS/LKWxRJvyMafyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
	b=H/SpmFat2z3nXKJaUl//O6Yyd3T3pcnhzUTQrhDcrbc5j40p0PgtNegtG9DAGoPH/BTT
	 liwpZHfJiI7wfFEZYeB2x6rh6K/BrRA09U8F8aWAVgAf5i/LYg8sSFF1OATcpdf4a3f2B
	 dW3PJKKUNP1+UtsgIhCQlJUJLMOnkKovGV2dONYdByP2BwAYIHa9Q7gTHNJKKy6Juz3Ed
	 RbOYALIHOk2hcFId/wOd9ZwIN92Zq9OMuN4TairAPYTI1jDXEjwghFhHA86GWczq5vnGY
	 0IuzXU6JMdoPlsgggrsYLGxZcHw958ibXZaBqOtOB/fCkE1CMnCY9WJ0y9QTJnpEXXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxDufLMr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64C606A31D
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 07:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F64C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxDufLMr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7O7l11539907
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 07:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=; b=Jxe8ahchk1wjRBJc
	s4o4UFhlDXJ0jw+NqXMrnEh1GWL0YaAMDQR4nmF8AFWbthX5JqJhb9RBoawKuzR7
	RA1hK3KqMQ0MySBNY9jS2cYOeLw383XT5U3HMmGmXTG5tmoOW8qURACbpH5MK+Be
	1DliUpgwv+GwIvPWHxNQ6gfRrpa2qml4v5U6TPSI5MaTcYfHtF/EWaLoV35PU18C
	zeJH5oWNEZ9f3RXXxRBQr7JwAKvbJ2yr+TNli3HzGMoQoM7xqZUf+rXQvK+lnb85
	0cWqYTSvEztmg1yA3ILUPgvO6Mr5r4O0fekBS3NQpMsPxtDXiFesRHaClSLhjm/f
	VqKgsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 07:34:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106bb33cdfso8448106d6.2
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481644; x=1793086444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=gxDufLMrO9bOWgzqrYf1MuhL+Wg7wbydTyHAsVrvRhHmV18Gezss4lLlVwdZ+AdCJS
         gnrRP6QEaGJA1Oi2YB1OgadLYAaEJrEHFGv5/Va9Xej2rp8YV4p6KV20MEvDHgQoh9lY
         s77+KRbgn7KrwdciuUtFchPsOLnCtueLd86ocQWsYzMUGbajglip5+hQCPu4hzdSPydG
         cDuflStcPPivxIacLHEbILfdXzMcg1BdlBD7IoWSDlS0kSqeHA+rP9ITOoEwxXmeFHIz
         i2ozk0vWcZ2BtwHr+Cku9N5/I9dlJ5buBaj524hmF30TFm7GkUS4t6546xVOYvJr7ovL
         cy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481644; x=1793086444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=hnutvFq6kb/lGTiNIlN8mCx6LjqwUhAsF+NlYjyb/OwaFbzE1u8cc4jqJbzf/45AtD
         9TIw1xanjBqbdb34JAvK4sRCg9aUF3o/cr/07yK5gw+lHcgwTAEwO5NOWYi47oJJj2tE
         9WH6M7pEXTRUVQgAmyoSWg/t2pv/BBjtunHkI1/Z5DfcwtgL5mExmlSVm4FvXmR9Mexu
         RWkG2FlqHnLxmTvi3bKGVi/PDHJM2yRQ1yaRrllT+pMTSaZTBZbLhSTxc1nBbn4F9scD
         pYuA00t2XbcijMyc7iYP0lsJBha1FXPpZ3P2SEbWGR/p+jpxSwvvQ1YK/g/n9zp9J2p/
         FwGA==
X-Forwarded-Encrypted: i=1; AKwUvBzGwgBke1HNmnKEiQ5QTt6lYlbgr/OEFVF7McGk3Cl9eUoZfT2EH3kdcD31lRPmkI8mL5BZu01XeVS4+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJWMEB4hqiboT4S4vJ+Xsy+8lKFECaGEY722pMFSFJhJArfXex
	0Q3jl4FnsnS1UOJchbDhCqqI3ENP0pe9WgQOwNBB4Lm9dZZNMe+e+dOca6lij317BWynwbHWsxX
	p36/G8flN23I6QjpZO92M9MkDPxXUl/ChAMLIGNl4TfyIX47LVL4agwwZ5l67BrUeOQ==
X-Gm-Gg: AYBFou2Fm8r7XqlC4ygRxJNwrQNIS3jO8YfxoBwx0qrKsCUhnefRi17IH042s4iGsBV
	GPAbAe8Pla5t/IAkp+tPRtGPFYJRdoj+HJ/G1BW+UgGfm8i4RqMKzFTPdSVmpNLHghQD7Cx5in8
	/l3ilnnVuoyuL6BfPIgIkRkDWn6tAZsSiuCZmwzkvJDjc1jFLEc3YrfBxITfsEru9XFkRVYm1Ke
	Le1qa7JRMwheTcdwmZWWF0QHJh8e3N3O8/DuCKiHt4V5XxiPzBPT+1j2yn9HByB3FuKn55V9lQs
	rPGSEIYK31T770FYQeFhTDRyn8yzLotHDFk85DkUZmWKZI47vevDsycVbYSl8P9kxoBuzYRKKK3
	i8jkDRSkbXPlCL2hGEudN3g==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179574661cf.2.1792481643586;
        Tue, 20 Oct 2026 00:34:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179572261cf.2.1792481638228;
        Tue, 20 Oct 2026 00:33:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm461490166b.20.2026.10.20.00.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:33:57 -0700 (PDT)
Message-ID: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:33:53 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7196c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=nd-lUt6iTfUX6z0NebQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 9-7AhSATr5TxczSBJ7Qq5I_HXZe4fjwj
X-Proofpoint-GUID: 9-7AhSATr5TxczSBJ7Qq5I_HXZe4fjwj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX7WOMGZ9lpP1A
 12/pDMSbra6BdKnEcxCIyJkMGd+ukkEd7fTzC3IqbF/etiNHd6eWpuHs3rdeGtEhTJwZ+eE0N5b
 /P/S9hxYIjid1lmaDWK/DnDmYklZaF4ZRtSbo1tUgVjHCqrWOgFmGfBMnxxAnxIXJlaZqcin7Kf
 Sp8vFvfIPgN35jWLMsEwypkZHWOX7WuJtk/mot7fLy+NdD6SQyCYYk+9qw4IhTSyAOqD/o2uEmE
 Z4AjLyiws6kA/LkPxXr/WbDEhHOXefyFjn4dYiwIbkw16mVKT23So8fL//D9GiuRp/E+M/1wR3M
 vLnpr0K+SL3NdYUgCnB1PNKnZVXlR/SjOerOL3UHqQJzKAcWRH2VThUtvHp3rB5dG/vWPbSVCvT
 myVmQK77q6aQXwYvXyEP19xrmamKBzN+tUsyxhpMr1B54CybRUSpEh9GZFM6R9p/Sc0n+3QoM1w
 FBbEezb5sX7ouv2tytw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX/sLZGwuyx12m
 6sicdTh4ymV6XmPTvu53IMMamyVVNKKiINDKi+YDeprWZ8j6xNwclxEcXzVe2qBLtQCezdabRRG
 j5h6bvFTgqN4VPdMk0cWDv00393o6WA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200029

On 10/13/26 12:17 PM, Luca Weiss wrote:
> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>> From: Jasper Korten <jja2000@gmail.com>

[...]

>> Drop the output-low, the consumers already take care of the state
> 
> For both enable and pwm?

Yeah

Konrad
