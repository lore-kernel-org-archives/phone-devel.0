Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575139;
	b=ZMI3kXUmJHnP/qgd+buIK/DHm6l9AWGUBpZDmt18FN9cV/uKP4ZCYj2qwXO6sfFqgVRp
	 s6urUknoW9KL8REnL2nxsL855EGnB3nJAmuePpda6xHxLPy+oNwraNfllMWoQzr3H+erq
	 UqyeVEL6ZthSZlieTJ6QatVAQKdefR1tKyShBR94dritd9z0fWajz0pYKB/5mEDwGX4xM
	 BKoraZ8PTE+cnwd4aJfy/MBKv4e/dEgDX4g0FJs/Q9IiiIAjW1U9D7sPhBAi1DkbN9ogY
	 0oe97U8hQdNkQJzp+yTuJ1/2LbkPjx+npzVWk3pj0Wsx5ODceIGDuVnZhIj/bD2nRsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
	b=LddC3BaZ87BOfUl4rGJf2bLYQT7AorYqronNpBwqLCkvopojMSRj0jstFISkcW4lBdH3
	 7MMfMEifxoYy2GoTNVRmy+Eyug51n0nTjb7ssnbVc16bCZtjKCTbfZuAvxRRNjasCr+5c
	 48TviLyfFFA4gTW929r47Mq2arJQbwtZxxRpDgmhjoN/eW5b60fuPk2VpaRWGDygrUYw1
	 ls5W6hNToSqYnVfXwpOaGQTrCx2Zo2KiAj6dkXTESsUhhmnyIwH57EYZW6SPnqkF6Geus
	 MVBqRghN75bGHQCdsg3B69j6ast7ME8IV8yYeIyz1BwQodT8fp2qTYZb3sn2GSfJVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HpMxf+Lq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A07606A31E
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfvHmY+V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HpMxf+Lq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VSXd2795069
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=; b=KfvHmY+VjG7+Ghrq
	KYG/RKWC3DY3lCqndyYs427hg4rcmoIbOoM2aS7mwOQL1lySBWMJF9m5EDTDvL6j
	40GH4OHn+LaUzPyegfS6u31qkJJA4prMKnxTsz9J3V/9t+WXwkaShb5XcPDTFRwI
	+VuB80ezlOT0gyFYQiUFeDKJW7C/wwoGoopBtJ0ZPlv5a5jdi7qaU59JuPin9ak9
	4S87pCYH0TAjPsEhwer2YyezJC8dJ+tVJjhrFN5IV68j5wWe0tjsjRCxFB3IXg+V
	438xYp4/RP69yrZlrppcXdZM/8muif03IgJE20RkOyUpWzTGwipuLMZDTKhMoXbC
	4hTeOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78cw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c008df17fso1580566d6.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575137; x=1793179937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=HpMxf+Lq4aX7f3KOVJRsvYnl/sRrEelfK8ohaoUZLzdN3ixN+KXIaCc0WWA7WeBmJb
         8Y0tVAgWqNSYB8G8nE7UaqJ3PgzERnti8hGO2NPjtqWrHDe4Cuvcvzaid3f809JdOK7n
         h8SVB74DcF2Lw2W5gjhJ267GFaLl/vnaRq3/VxwDpe6a6l8YpBiXt9uAFq7tYPpYSpyR
         i+BkrOb9xyZbgrP1o/LeFFQMLuE+BGUNXL/Agn7LZbMmXXGNM2dbYVXUFUht1eiTYpGG
         Yv3n+fZJ6X0MLJRaaJkKnVZ1hW3IA7nLk5uD5rmSZqluaSHYAXhsUIsiYyUng1BaUH5m
         U3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575137; x=1793179937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFg9LHbSRP2xPyhOEVaOFhnmGTmawMBOLfYiP7u6GyM=;
        b=ceLlngHtCG4iu946rfvEzfUpX8zykYH8H8N+tP3FHANkugCH6VVA9YaG5KyY1/sgLO
         dGWrlCy6RsLLcwV13QevYHfK9doclYq5kRCMLSgrfT6bBgX5vd54WLQtm4C+mXcHam8H
         fC1pEaPIvQ/0vVcfxL3+dsRF0fXE26C+zhu3PEeQhpklrcBOo6KCYZvXGi3ykgREKugp
         PTcOoJTYBV7n7XpHoprrdV2P7L5JrWCN//pWkMs5upu95C29+Fquh490jr7GM8Uno3U0
         YN0nwq0vXdXaVy3qzR/b6cNQD6i0MY9jNoeka6Gi7L4UZeyWOM+B+KouM+Cpd1iukhFA
         tLpA==
X-Forwarded-Encrypted: i=1; AKwUvBw/Pj28uAnGqISy39Fvd8C8HZBAYCp1tP2yRmSnktOht8tw8AKrDCyymbOjpKPb92rWuKdr6RjFAnlMdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIy4DKb3r7TLcPAkSasnVplj0FD+5cVzwlV1fSzEAJbbdwR84Kk
	8rBfZtMr8Cg2MANWXJPqAH/rxWHcVzmA9DaNV+S6R828BoBh81CQUBtT/wgP9zJyT+pMQCwt3xJ
	9vI67HCXW7EOZFj65uDL2D+nB6GyxQIVVb8U+W+kHFCIfkP+rQCf8PCcLKC2s1FDInw==
X-Gm-Gg: AYBFou0bvsMgO1j4G51aA4rFnzJ2G1pBGcu6S703jFJq75ogzskflnnEeIXIS8kmmdY
	aLMxYP4p/WFfLtXewBljBHgEwdUc+YVnHrx1kxDZBkyWqEms5RlUlEf9in247TWnCB77aklbMRt
	Icy+/eIEBoMUOCItNBNZPg2xQ+ZK2mqoZQfDHb5E5NXXkifw8acOiz3iUwLQefi7OAkT1eUFNkY
	FaFo9lij5S+Khiir+QHCspXr9CP0yiyjBFOTzkXL5SBO0T4d+jED4PXhTciZpD7wkhBJfbqGY0h
	Ii34JNAyzPxKbEUAJV3MBSdVmq6tJZlVS28cNtE6oGiZPdrH7YC0r0tkURoohKea85wcGSE4u18
	Eh8VUWWP37rsBPBwXxmS/zQ==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675641cf.5.1792575137538;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr17675371cf.5.1792575137058;
        Wed, 21 Oct 2026 02:32:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790055a3sm58780166b.69.2026.10.21.02.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:16 -0700 (PDT)
Message-ID: <c7253a19-51d1-4525-91fd-0cc07a4640f7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:12 +0200
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
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-1-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UTbI1KUf_zZdruSU9UADEh-9-TxkH6UB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX0vu64eGqy9wJ
 77UC2BGjXiIuPFw140EC7DcppqRlm1Jf/o9JCzSiU8nPfI7S/mDiBSOI3eRJAXh1SpgezyqYCOU
 ftkbX5kWHyLjI72BXoeRCJRlk9zYlrYDY0hJGCieP+uwtqhDl88ug/EgwqTTbZzy+hjVQjQyac6
 6z0KC0CZUeKLmXol8u5Du7aZuYXLf8JjQPAdBLnbB1WCE6RxatgIg6Jqa0JfrpMJzCklBEm0Wy4
 i4VTG9QR64+T06Py7FtFh01xgkM3RR5bYm0zeOTjFRN7mGNoNq7X78b93SUOc9BKTxxSHCJI6Mc
 3gUL6iL6qb7Hi/Oeb5Z3P1gnsSInS969Lr3zlTbwlYutGtYkfbUadKeb3NWuYuyQMp1znfBCwKU
 GvXNxIGYPCKJ8xHtQ98rYN43eVMYod2e/FJ/4PW3fCgQklQ1UN1DqTrEpARTJjDpLSuZR+WoPb6
 MXhF3aQzFWVmpWnbltA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzFZNC+/aeLDY
 d6s25d86diUJtDcD3Ly4KNXAQJPOObsOo8sySIvuaVV3hMom0xEOyrk8rM5UkmyRl5iwNu55LoB
 cuHYhwm0xReTWU8AAAxZVO/VSHqvDV4=
X-Proofpoint-ORIG-GUID: UTbI1KUf_zZdruSU9UADEh-9-TxkH6UB
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad886a2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.
> 
> Inspired by commit from Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
