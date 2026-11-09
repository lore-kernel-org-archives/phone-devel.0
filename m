Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222391;
	b=WgoS3nQBUD6QqlRwlHYoeuJNaTbyNkXhkMRT5DNV0FRF1h/68Qud7Yc7VIC93ZGlbgLo
	 CwF5e8i8RU8P7IRApBXJ+HCp4WnhWo46EtsUsPok0Mzzki8rGZ01+F/kZjn6/gShgmcvU
	 c3IKaJuUcrEjznzT9/I9RMJK7K0jAPqCH9Ao6EMqBrUJHWcCWCbvEx2Atu/lJZU7AdaNL
	 H0+wcXagDN0hoLhjUY3a/YkPFljAnhAMss3nnkbtmyjZMmgfSKChj5hmt3nmd68rPxQ3k
	 lIisPTVOmNqYZca3QXsiH2p1siM9NbitmGS2rHruRPiKyb+Tf6cUKVIJep9skju1Gkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
	b=J1UAUWaTmLubDSmblAdVlsyEbiSJAB7m/kUcV0hgxpOlF8TNjONTx7KITCECkJVYUYdf
	 kt4bDO0fnXUyxPLqBEtIpDIRFwNre1LiWEFyKwOKIo6ww/U9AfFbEYmqVkJW+wUOAL9kr
	 YC52X1OVfH7epJ+r9GDg/iXZlWFm1z0Kwx7zR3c1ppBxNB9ngpXkNLiQ6NPkO4ARhDEVE
	 B5xz2XwBxQ0f2OjcwOZp2/KlCLdTXEK7h9lbgVjmBkn2YfySDhkPgMuAuiGL090HecL27
	 WE4YnnFH4s7BSqqOPr0rPSgpkOkgqJ92QSvY80WuDECpdr3Rd38XvQUMPy16a0T+Xrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51B606A32A
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 11:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF51B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nRkS0TO7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FM7RtreP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ul1g3600459
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 11:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=; b=nRkS0TO7MF+qY2hN
	q4vCsuWAzCc3xJRHF0iM01cb48E0wsANfmQtjKGnq15nZajIM/6EvDU4w38kw53c
	vU+Ma9dPr2FyvtGtDkzox4rs7CIrgXT1pKW1zIdpI6SP4COcwu2Omh97S36EN2HH
	mcasD5tJCOZLFJYbuxW58x1S4RontuFyuV+/LPO3XWCFK44dRlPJBrfUuEQ2nU6u
	MvS37Ftn4N0qk/MZjItIp7r2X40E50qNFatAdxSdW3NhVPPTnlMt7MQxZmat4ysw
	JrAfd4j0KyELZeyBmVkaEnci+/ebl77WFmFt9AYItBaujloW3SvJgj3N2MFw9Yn/
	Ll9hBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588pxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 11:06:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943fffbc5dbso17195885a.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222388; x=1794827188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=FM7RtreP0fF0YudoAfpcz6PmoIkct9fSqvdhXamOp/pb2OJ2jlcJquyaPQ/FePvvK1
         FuRyweIZhpAf+UmWAtLt/aT8wZaMUhRyw0i+l9FgdqWmsGHo1XLdr9qyhbZVqkGRsErk
         K2KN8ZJzj37HopXNnuh0RmKM/LMGyHnq06Ty1F8iRuNFU5R91sziFGrsXOF3XZcK348d
         eM/lGsSXXkjO1vzkzRHo0PRZiS0XtlaBfZDxss3aVJzT7IaDe45Br9xBBX0H855v7tk7
         btaf2vuV1uCzog49Gt3nJc1vipibYkKbf+PiScLS9+P2rxPXHWqvXVT+5q3psDZZyWfg
         GldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222388; x=1794827188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S15BuGKMUQC8qFDCp2KNUw6LJAJP4K8rlyz202knk8Q=;
        b=IDIjUJdiXzwJeaPU2i2xtoL6/7obVrlJj1VHpK65tnkJQnIpA3eH0bPJWwh5V7LMDp
         bR7EuM65TqpCpL//CX53R/EFvoUIqidaJSbnJ+FiE6fqbpEvKoVaYP+rWKDLzH2vLIsd
         m23nhIWWwb9KXSzRz7n+KA+25KcPB7c0IAPocnRflLkDDSrzsXAPW0rFdFs98Stn8vDb
         31/ww1i2/oRDlVp4dHLdXwfERU2q4tvcPlAzZqnWaddAPLe/kD3L0Rkl8mWtNdSmNVAR
         ue3eKbcWrOut0EjHupsLKXQlHYW0cL6RpCHBpjjeWjDoYa2lHPDPCoSFDEiiz9TS1zya
         9oOg==
X-Forwarded-Encrypted: i=1; AL+hErGpLjdB+/SC1hoVnDQxLpHPdvPG1ADZZkPIRqocZxa74f14r4eRCeZH6u6ZnfPkmlCWukLNqZ8QhMN8kg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PsHZZQgs7R0kzuB52VklpWs6C0ID08vKgwJm1QpAdCTbGdqiF
	8uD7QdI50kU/9+DAMglhqHWa41lFId/IyC9PEpT0p+aQ+o09vrjT2uCqNv5La089SYXQIA0GzZ7
	MUEsOH3vgSsbhp4IK70/Myh07XMXkI0lG9GKD+21otOZxnolVoG2YYSaf3LMWkBxhyw==
X-Gm-Gg: AYBFou00RYlOYl8SyQnMdMAcvW9aQ08dYCKztqnplp8D3vMFDWciJ7RdeBJD8YsCeqN
	m/Io20IV3QHxf4idmC7NTJB2D6cRJwIuU5edJAKKL8ioDyLJmDwljJ3AXfD11dk8WOYQkniI62H
	V/C8HfrTIGW3KS8OD2Z6E2Xxix7YwpLbZc3mVBIPDnIUzyg8iX7RFk1DNMgzdobAV8LUpldUdGz
	WzjVkp52zbKxA3kViY/a7SG8DBT9j5JnbxSOxNVXtjOwLJlZlavWk9wLnjmyJJIGawbUc2AKuIQ
	JdZHFXAA3A6R5/QKzEvRV8io5DaVOvbmqjlLge8B3kiWe6suQL9UMD9dh0CZwb31IebL8BHXrOZ
	nyzFxfbc2R5SCoNqJjpFqNbiA0XEoF9p5hQFeWUKXEe8eqscMuMKkisEPYLzt6cqsCQkGwA==
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514318085a.5.1794222388189;
        Mon, 09 Nov 2026 03:06:28 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-947842adee7mr514312685a.5.1794222387596;
        Mon, 09 Nov 2026 03:06:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm150435266b.77.2026.11.09.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:06:26 -0800 (PST)
Message-ID: <09cbc285-1ea7-4613-a638-6921afce71e0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:06:22 +0100
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
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
To: Frieder Hannenheim <mail@fhannenheim.net>,
        David Heidelberg <david@ixit.cz>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
 <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
 <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX0uRe7PtO8J3U
 JL48wTCsPzKh/wOSf9pYfz94FbtoWOVh4Kg69TBX0gD4oVyAwAk8/1/h6zj2Rw33YscEMcMaXAQ
 RKz/gwdzYIJAT7TV6fNqNYSX61kYT5+vLWf06Z3FINXpm+Jm2qcp1SNliprkcZGmJCACH7D4t1P
 ZbxRY3j2c2auqprOeETqoVSNcQT8jtfSWAw9CJz20ogXKukK7aRe3ORiOAvYZ3Jeh3ckwZ1TjWZ
 qk2/S6ojcfRNJRNj/HsNj3aNJRzWPzbTye6dFp01+ADFO6SZNR7Z8pc6Y4M+bkhe/L4MVrGrvsn
 IaDOAc4NUMJKncEYDsw7LFiy95z1MJ6q3REju+GGR3b2VwScOZb5xrFAM/gISR5s7Ds1+VD8xvz
 5l08PH/Ub/Ry+LhP44CbN6nAo/8YN7cboprWxA5XCXcq7ubJqFkKCjWncTiSLDgZElaZ9VH38HK
 p/TnezA+CM08G4d9H9g==
X-Proofpoint-ORIG-GUID: f53nXae6IIrfQ8cPsoTcAlAteOc1VybB
X-Proofpoint-GUID: f53nXae6IIrfQ8cPsoTcAlAteOc1VybB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX8jSuBmp91lEb
 xBOUPvHyvnmoTETKY6KiDafdsOWiv5rsFqumc9a8He/CMkW3ILZf2YYP7OSjuC8l6vV8olHC8yK
 Gn/cILE9UqOzilVHMBXIUTvOZU7KlNc=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1a935 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WE8o4AYwAAAA:8 a=pw2Kr8DMFsTuVtHO7YMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044

On 11/8/26 9:58 PM, Frieder Hannenheim wrote:
> On 08.11.26 21:52, David Heidelberg wrote:
>> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>>> Add compatible for OnePlus 8T
>>>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/ Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 50cc18a6ec5e..c21ef16e9ac8 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1067,6 +1067,7 @@ properties:
>>>         - items:
>>>             - enum:
>>> +              - oneplus,kebab
>>
>> How about oneplus,8t? We can use the non-so-much-confusing product name.
>> Looking at existing device-trees it seems customary to use the code name 
> of the product for phones. Examples include:
> - xiaomi,lavender
> - google,sargo
> - oneplus,cheeseburger

Indeed this is the precedent, I see no issue here

Konrad
