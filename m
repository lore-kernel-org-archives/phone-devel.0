Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5A306D54
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764328447; cv=none; b=dcM53rtydOvU01Im8vSQM8dlj7RUQdKLE0bgQh0tavRmd8KHdtDuMAqf16QI8VPnXnS6KqRaz2+HFJROuR9QAEvfbn4dNThzUgy4tIEovwfxrtgPDXatJbOhZCJh14xm54l+hRMayqtbDSgNTnx73QixFxUAxj5sgR45UriW+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764328447; c=relaxed/simple;
	bh=6NzDnvCbY5+gujzQWHG1qdZdNd93vkH0QwTbqAYAodw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWMuW704JtrPlkEg5ukvSvYueykCrrEvNvIAFNBmMowHzlH+Wc5zYx6exi4bJuu+M35Ux0nwGdCSgcFWN9RPdDs6orr5cS1Cu1P/Yht507vY667X2/uwMJrzFtP7XRIykgzSer+D1u0OwI4c5iFNceSDk0kSk4ug5fhSptsTyAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADmtW2Wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkaVUUrh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADmtW2Wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkaVUUrh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8NuMR4191696
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 11:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdyKjK3yUTxHRTsH7ahf+Tg5v4W/bvGpPBUZXxSBEsI=; b=ADmtW2WcUfZwjBrl
	s32sKJl0sy1zW5ji4DcsTTKDFCexmb0pD1/zFeGaUSwIMAniuH3HPb1u1lpdu4te
	aUtrCxHlu8pPr9oUHoc6f3UwTkbdRB8hq2s0R8yB7yj0v2aslf0vdYGFmPlBeAXT
	s5NzeeZC8MR/lSWjpDTQEnKueFEzEIgFG7g10QK0yRQhMRagmh0W+ZDgoGWxfcFn
	hAxRuRY9GtD1h9Unxm4PYGu7wF1lyg/PY22t8eL5H+D9/u/Q4WnRvNO+bP5aJE03
	qxjjquShj9IneP7ump/wxBWg/raRY1DGRWMhoXBAzyyCsF8qsCvAqFuZ31lxLY7N
	AFIXKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fgyk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 11:14:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so4695181cf.0
        for <phone-devel@vger.kernel.org>; Fri, 28 Nov 2025 03:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764328444; x=1764933244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdyKjK3yUTxHRTsH7ahf+Tg5v4W/bvGpPBUZXxSBEsI=;
        b=fkaVUUrhEgHTqn8bPI+k3wG1O2XNKDl0ncKJz4N1W3tNleF369Brg4nGk0ndQw/AOV
         5JU/xtIyzzZ8M3Wb2O7FdS5FWVvTGSjc6I13t22ivGqRZaY9zHOigiZ6SjkgWDDQjK1D
         4TdeFt/sVybjcichXjqGGB8A8Z++D0H1fY9L6/zk7meoTgf5vQsUmVGj9U67O0RSIRVG
         nw2/mUsgG45+Sw5CzO9gVpk5AHgYtGzI9rvLm9VmRnAVp93zna1INf0Kg+OkckEBb4yw
         7LquS3ZgBHV5bK3Q9G7Xd8rjAbi9oi1GYj+o0Y9o72fVYA6Ms9iA3IAHroiXWj3grwyw
         1YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764328444; x=1764933244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdyKjK3yUTxHRTsH7ahf+Tg5v4W/bvGpPBUZXxSBEsI=;
        b=CpFhyMc9RAvpjQjyTszMyo+ST5cia+YWEn/FCERAaWXhrM+9z9oiD+ae4HjKr2GDp0
         V9aVG7WWCf8/KQStA4AGrhf43rJBNQKNTsRj7X4e9oRP5mr8fTcGoHBLyMfXNpduoTmP
         H0LSTA/Z4RMMw+lR/veL1q1DulscUlqbI/oonATyPNbwJf+jFR4pG9Jw+CLPxw3sRTC+
         pJtF94AQxd0e6fpOZmZ6+J/iXiKOaTLfKw3dCBueibZANRqObnj5skYK6tTxFrQgxjWE
         2UVZYRtIoGujUldUJzfwFIV4jPGSN6Y6R/UTvJYwjimm3ZKn92EvC5fkIgoye/7K6Obi
         iWaA==
X-Forwarded-Encrypted: i=1; AJvYcCUTYvSVO0ZyxvcKCkdod9Xx1rFO+6/yHC4tsAH0zq+Z343o0F9jknE6+8stY73L+3kELKlwWw8Bal2MgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0lBhw+na5oasytxlFfHp+b746vejRuquxP09Dmm5HAlGejlc
	5upZIOZenfJInCy3brXA7WaIDvb1ZKC2iotlnuAsp9lyNXXH9UZiCXQcXDadhVjXqFOuMWL31go
	7fwQ+CgkKw8iHM1GpxqHrR1lHFHlci1d6imPaj9T36eMZW9Synv+uc4Y+OoPy8fzSKQ==
X-Gm-Gg: ASbGncv36e35lYmKF0I+Vv9wSqqX3MRjUhOnv+AMoVgAviTFIiyUZuvZENc3/HRZDm8
	r8rIE22isTXxz3TsR6CkBOoCXM48ebFb8JVzDnD6EwhM76KG4JRXNgfgXs+46O+JV5oJV74WrIE
	VU5qB4HxjO1ygYopKhUstwo7ErFqv45l3Mn0kktNRUmpFhULUqT43ryOUBxTSDWCICosbYvuG5M
	MWxjndhf53JSL2Kdi/pC5HhPSkukqaHPj7pEqrtz6V4Asoofb+bMI5PnN6W6ql1c4+s5iTJl2+9
	0ke1ske809roCXh+w3fAS4uh/OFIqX5BxF09YSalpQgNqZgU0QpLzIoZJ0bix7vi/roIwiBA8Vw
	LIlnLrhjTtKbYnIjLq6k9+whHtaCY3KNlZl+Lco2yaTARP6NZ0bSfp0+cy+jv07myZB8=
X-Received: by 2002:a05:622a:1349:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ee58941ff1mr273986211cf.10.1764328443943;
        Fri, 28 Nov 2025 03:14:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmPxjenl66dAD1ohk5y6pxaCsYenI38wsjZB+43zYyXsnS7DPABguezN/7WaotxWC1ngm4aA==
X-Received: by 2002:a05:622a:1349:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ee58941ff1mr273985821cf.10.1764328443520;
        Fri, 28 Nov 2025 03:14:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59eb401sm406059366b.54.2025.11.28.03.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:14:03 -0800 (PST)
Message-ID: <b977d495-99ed-4604-84da-bec39594ae10@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:14:00 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] arm64: dts: qcom: sdm845-lg-common: Add LEDs
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>, Pavel Machek <pavel@ucw.cz>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-4-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-4-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z7qoOQPqNZoghs8B4U84c6yv2WeeJrrj
X-Proofpoint-ORIG-GUID: Z7qoOQPqNZoghs8B4U84c6yv2WeeJrrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX41TIF9HjTFA5
 89hhyspGNwqa/FqcRiohdMeqADX2K584QQl0E/azDihHs1jUv5ZzZW/nv5wSCWnIKrQlh2cFNMw
 b4YI/ld9JmIWXsfecPI01QqrRMv9nESnbdOJsfIsRWygeKQjlT/8l9X22aZxM8ayVTTyUGD64B2
 d2Oj6zzA9/8L1IyYzMhi40f210YCU+hSylvrNfxBDff+KrC2HoSCqOTP+BWx+rLpr6S9m8rE3hC
 p+6Axw7xRN+QRS4G+IM6HH162XjZ95nZVAMTP6u5sN7hASCh5ZYHyoRxT3jbXWWNqWLnU/9KIjq
 qE3yOr1vDh7zK64z9igKXkqr66lE9WzooLwpbTSkh1JGVJY+FVGhSuFLeQfKAsObwgZloUn05/B
 ki48TWhlbDusPaTb0QodkIChc31GRQ==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=692983fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=Trm0UzkazMAc2BRhCbsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TvTJqdcANYtsRzA46cdi:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/25/25 9:12 AM, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@protonmail.com>
> 
> Add the multicolor status LED in the phone's notch.
> 
> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
