Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866B335A939
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349362; cv=none; b=NDUPZVimuvA5QqoUa4nhc4M1zjHqqsEd4oOBkozpmmhD2ANO9zZtRB/buTro8BTusIFP6x2vikdL0XlWlWvBvI9ZOGMiOMKhNfkIYYWOcIx4mAYWc0QpcxjI+Dc1mbxiDkwShylG9gLzlwrKE7fTYouB9UKaKPTou7NvD08QOi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349362; c=relaxed/simple;
	bh=IjpnHCeDmjW2Scg1sXPAEhkG9xa772e83xdWC05sYMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0OAycPf2lGmKHu/p9bQoZjnkLXNOt1Rqxz+w8B9MSFHygf0GJD5uPafVICzh9c7oszAsH8Dbl/doQXtvHaQjLDY1i6DWXlV1wrKciAvLhDLZAsvJCSh4rJ2nZn5mkmrvvx6chrBJFEo12pJfpPHJmDiJvb17ZeiudXWyNBPs4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCjRROio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOZONhOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCjRROio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOZONhOK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7REmr2371532
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=; b=PCjRROioC//sHb2H
	MVjqUuBH3UJnURQXC/0a85yChIymRAYk6d7ZswgwTL9udZZFGSkAHktssLpoJZ8G
	0v2S2Yy6dtMxqaZn9Q4eybmy0vZwvLdiJko5btL2DIEC/Jbrun7nj+eE3SXmUmK4
	z6gx6ZGjeYNIhX1fURrD3vinzZdHDRh13XasJ+kJOIwjS1VrEQp3XsDtlGe2x5wc
	Ai09wCzhXD6u3f+JHwkp4O0+fCXlWhd6y9TlgBMq6UptOk6i0aQXfyDC8X394MH/
	UFaIPQmwcrqJqUEd3u6yOVQp+o50J3pHGM4sYwjx7EwjTZEKpRc7NX34U3Uwrbnr
	LP4I/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830qfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 10:49:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2955cc1eso31683031cf.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349359; x=1774954159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=;
        b=NOZONhOKILRG3XhsmwcOAHEinNdQUu9J2sUGtwwU8e/Mpf8WCXrFiL5PFnV12pcs+q
         H81Ld59SgNCrvqiry1MdRDEAwe6khbLPrXeCWZJdbU/z1gR9V5e7dz7knrZ/2uDac0z2
         GvWwOUGylb/JVSkC1+gD+O7DchV5z6TVJvKnETy9i0u+FNeQhoaPgv05QL4yebFBdpJ+
         hxhdGNC/HsXmVa14WCQpGm7YYhz4Ia7pFhrJZX6vn6YYKoDq8n9uG0njzUvEHA75PUqz
         cXzj0LEUcsioEZt3WCUOHy3G/ZdQFr8cTd06H3lLxyMmCAEldHRDhtdk+h+k989spYpl
         KMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349359; x=1774954159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=;
        b=fw9TeoFcFd48v83NAoN5w3lLZrUMWjAYXw9TOeasq/qjsmwrX73kExgpNyDXgnQfab
         9oZOlRwCdSOEZA1POsLqGal/NIFfP8pQQzd8Fh6X8DNl6UNLj6l1yr+u+26CAdnuRA5i
         1RMbO6bVtor071/jxvEQIlHVFmPZLS8EO9Q6IAd0Cjl/ygBMuNZCjGfS4gux5LK2ypfV
         T5Nfu3kWk3SSvmUEpee5+GVKsaogHbrPMxy1VeD3mVCTFV6jVr9c8fkkZPYY5wzOIg3N
         jXBMlCvffC/APljPIxTVBXTqGZCIaHlAKmNkqERWm5ApD55HNWtDaI9oqxXnlG0PslLc
         oMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhsD1aqV3BScnWw8GpgTyRpwrZ5pvoNd6YN9yxVIjlOnzl0grgvjFaw3ukOTDwgCWjf47/hK5JAAqmPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgY5MgffRP97yWndJBKJ1cga4MKD/Znr8bMwrdxhTZcmh0LcmF
	+JgRfMg/BCNImyY/4j4ictad9B9GH4BWU0w4Q76nu2KPaBIatZaBFIqn4njox5cKDWYEO+5gKKF
	sbrDsjV8zcgoTsI2xrx+wLtKGTRHlKkmTUbD9OtABZhNAJlxY/fzW7S8thAyglH3qfw==
X-Gm-Gg: ATEYQzwHXrCZP/g0K0rEi0q/6jSLOCRiMznTyIN8epNg5LYD4w6DxEgUNkPGZd51rcd
	M94oD0Nwbu3LhFhAiEyQYVRBYkRHQQTbiYRq7WMrbKawxiIgeLq0SU1Qs4R7HB/GXVGY0mbzQDX
	XF0E3Qk4Pj7TSabIajFF+mUUL+6tdPIQZw8cembdZaLKLLZ4tAh4osfsRCCoQ+DMmFJ2YG+O1iA
	Hi/7WHulw9r8/31o9qi+i6JsG601m6oC07Tb53Dh3/1MsWi5UcDPMNOhUphHmzzvL+GiPS3m1KO
	aWCApZir1R4OScbmfXBunS+ypwM7il0kPSGLlLWb7z/FjdEdGvtD6paACTkw4pnwT4pBxkQ1CtM
	sltDSqiPT08qphaVPGd0T5gz8i1mAhuXI9PWqm/pdX/BNY8/ft56Wwf3SFubV6MBYtEq2F8k0al
	uGCqI=
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr178260261cf.2.1774349358670;
        Tue, 24 Mar 2026 03:49:18 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr178260011cf.2.1774349358231;
        Tue, 24 Mar 2026 03:49:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm630113066b.54.2026.03.24.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:49:17 -0700 (PDT)
Message-ID: <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:49:15 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
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
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX2ed5hsQD6I+X
 af63XYhknTzfVuWzdokX62fW12wojMZ8XCT5muQ2UpsDHIzzGEQE4F9RQbP4Vi2fyfpE9Tiez/h
 /MASCfcLLXAGJLnNTmWyN971gSCzRv8oyaw3/o/owtehbOzjdmSkIPDV+ACQZIKzR3rF/vshuot
 Q5MHocO0c1hx6lTYcIM+ycXWbcELi1BJzKDSCrpfSIgr9zCiYVGEvOdoEJ5sKxhJrEWTyCCciWs
 UOTKpuZUEJA9Yw+uoOXQuGuRoVQD6WCQPXyLh7DC1CyuGN95eJhmj3SPVjtolDNjIa1zajweLIH
 bJIuyLFmzCqKu083aAmQXPpzpT6FJjC6HbNq+kPjsPe4Vt5wuUwsG2amNQEvOHPipBwsoMtD/hL
 yjWVMYaWcNh5Cv3VQ/LiOv/PqsAgYmvuRs03Uu2cro7Pa53TPCHK3qz3TBLar6sbZwXgwS/lww3
 P/h9W8qCKc5TNLIARTA==
X-Proofpoint-ORIG-GUID: HsRlv0ygPS3o3Gb1GTZXAmaq-PWduL3X
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c26c2f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3zMdaVOh9OzsoKMNJxIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: HsRlv0ygPS3o3Gb1GTZXAmaq-PWduL3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086

On 3/24/26 3:06 AM, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, venus, gpu
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

What about the other board (judyp)?

Konrad
