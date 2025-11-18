Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7F26B75C
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469211; cv=none; b=FC6i9F0qLuqO80TF5VfZTsBNO5zacUwRun7mzbaVR5pytF54V7XwzdcMHoZ1BguyTwW5G5r2On4rZz0QdhiXqbpo/Ij+QQtAfma1DZq28EANUctCZrBcEM5Q21oJQykmNZDSOQleGiBwV/vbGAviPGTWkWOJUnmt1Ef3V/Pc+AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469211; c=relaxed/simple;
	bh=yJJ6IeTtTpFGE1AGu9hntqLU7SpeHDHsbDpHfu2Ayao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JW5NYxL6zfszbTLfxTE1w70jRtKc2mEDQPRiI5ziPAB6Yr+ud0ncBK1xob3Lh5KSYlmoI92bLQ8uNnkzYfmm+Bl7vXjrICD007cd30RWs8Jwe1CQvdWWfU4mjjefxnisDewOp5MYMzZu13LQ/6tq2D+rZMe2qPwTfRcRdjh8tE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwRRu+MC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xcsqcgkw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwRRu+MC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xcsqcgkw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICB0gX2802575
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=; b=KwRRu+MCgOwJ74KV
	IByhtwyp+OmF+NIBMsdfaKXEwLINLdNDBc9uP8PHmzmN6nLD23Gp+Te+umlxSy5W
	D54l/pGPqxwaYZbNgWBq/PYy9Kc7nS5lt1ZFcIJNEhxJtDQPaiUT7GUKcaLu4k1k
	PHBRFAZ+Qs6rBcqY52VBEU/jq2Ceah/+JDHXqzV5ImIm2JUf0Trl0kOTv2SPlc9P
	3eDWW7niR427sTkCU6w3WjCOu2mgZr9W8CVZY4ERG5/uT0nteGIfe7Iqm9LiJeKX
	TzFl2cpMScntfOXXJRhPc9wgUC960x/MAi4raLq2uBfb+SCTlUj2xpSdMHy+tbs3
	PYNYtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk201v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 12:33:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so10713151cf.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763469207; x=1764074007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=;
        b=XcsqcgkwfvDU1pPambeuwzftbKoQhnx7s7zEMdJ5vZgRwe7/h30iaGbrxHZ9lkf51n
         WgfwCY60n3l1F2fYnUoYqsUR++QMv94ql3h0tJ7KQnGxcyB1Uw0/E5BV7afTsns76c8n
         4LE1ZlEClvV4zHjhi8JrE/Dz10xI78Q35MpEIfCzdVSu7qRY3Fl8r4ANID49fZUFwRJg
         lMnA0ZIWijktJNmkpaSsLgiiwXkLzXjUmChs380ThtGnZgtvuHTJf7I03wmLczYy0ZoG
         8Kui64mzTrduMARLB8se46MXUgtYxWxz8Mby4kNyyg7XSflW9GUgEBLdnyfXaYbQiZwQ
         SpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469207; x=1764074007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWH61jHILhuuM/eqN9zZnCfpTwI2FbUKKoAu6Ut/IXg=;
        b=q6Z0uhUc1S0ks+2/+E4pf96e2NNm5Qho9zIBLng/E+T5Jfi45CAv5J47g2huTO+thK
         ZyqDGxW7/J0jblBoHJY4EmMTnpfFdTN++p5dKrUMXzM+3zfgmxCsRDBGLMw7a/JGvIzZ
         D3MYASSzQVTkXBW9Im2uh6GVz5Sx+5tYWUiZ0NIBmSO+Kpl7vogwSn9oXLd+RWSFJP1l
         aWoKtvpGl72+Bs5+n87a5sdYQG/iNLfW3SWVa2vD7vxu9GXrCE0RSQO2rpYaKNsbpAL1
         uVvLaKPXzUY3diCe070tEIiH0ALE4shYtgoKm5zlbRbViezgOcOpTAzQJlSxPG/h6mO3
         /ryw==
X-Gm-Message-State: AOJu0YxGmv1KXWOXVVBGGoRAxw1FpVRHA0znc4ziSiyzC+Nor1Si93xy
	7ngdA4V72AheXojuhkvKqndPhw45glhVrlCjn7uGb9utd7UpSnqye03a+WkGSi3vxjjATO2a4Py
	Rw1Tn7lBQW+mLvqbZU7/QBECBsDct0fH1oH6776de35D3oTPydIf9seUJCSHn4Qb8Ug==
X-Gm-Gg: ASbGncsX46cp94CWujuLmxiHNr+iGO3H+xsEQ44b8hZVR4YbfBurL5e28mbjjaafwUO
	7agIFkEazAzxSjSlT2vqwbxvgv7xU71LmN6ZYXxhAEWeKrKD4cdREH2il+vW0b/qp6yXr8+Cfyz
	BBA4qLcXVDiS4bSv5dhzz4IgLe04msB0tJeNEXX/ZgsC+z7VQuIKWpIh3Oce0HIy4WUu8PVdDcJ
	mrjbr1QUtcaSYKpy7J34pXDOIlFdw+IRMST2PU1+EJ2qqyQpTWSp8Fm4Q6nWtXgPTIfSDQ4X/2H
	5jc1Z7d9DPeAD5nSB/4ZDwtg5pdV0h4EOhH05tu1FA9QnSNQZmCN2AVdOOE7RRp7i30buIQ92QZ
	/UPB31nkxNJL4mUgRXRElbA0sYXL7pT16WNfl3+pHp54zkTRdXOP5ooSyDWQIRJLn3Zs=
X-Received: by 2002:ac8:7d50:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4ee313fa866mr24770411cf.3.1763469207013;
        Tue, 18 Nov 2025 04:33:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB8OaN3tmFzcOE29+YjSKwC8Jq3pDXXlW1BguEgp3kVHDiSSO5K52l1zjqF4g8J3kaErlFaQ==
X-Received: by 2002:ac8:7d50:0:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4ee313fa866mr24770151cf.3.1763469206515;
        Tue, 18 Nov 2025 04:33:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734ff75e4fsm1345957566b.12.2025.11.18.04.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:33:26 -0800 (PST)
Message-ID: <715ea6b0-a8d7-4ecf-b0c7-f4469c94b969@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:33:22 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
To: "Rob Herring (Arm)" <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Casey Connolly <casey.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, phodina@protonmail.com,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz>
 <20251118-pixel-3-v3-2-317a2b400d8a@ixit.cz>
 <176346899005.2610273.2055455026150162691.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <176346899005.2610273.2055455026150162691.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c6797 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: XoA-9MRGjgLRGFLu0hJMQ-k9c5Agfibl
X-Proofpoint-ORIG-GUID: XoA-9MRGjgLRGFLu0hJMQ-k9c5Agfibl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMCBTYWx0ZWRfXzUIbRaf9vzOR
 VEwuiIz0I8O7WwtHfUw1nLl32oNhJsk/15serEwyYEabg8Z3ED5l2FF8kYtzmCVUNm/uhwDlwNn
 025fePda/Ohp5nQkqbiVd0nXWydhtzzfBTw3+VIyH7UnFp/uVzwDLudRDEndBPi6t3LxTzlPXU5
 xwCbxr8NSyx0oAzCCav1mpX226yxiWGG5kaneVPiQRKfwp7v+nZJ7JLo1p/o+8qfeNHcC89xdLf
 8kPvPh7tEJ0QntIm0sAUAoH7NcTegPPGUgW0JNWzqWHwUuT2dPKlinZWdtykCiU1vV6V7o7OPaA
 nCN3eXc9kSTGFLXIuT3rHOvCnQs3/vIr0RWfEbqXBvOC2NkQFi9WOS9ZAlrtCZksV09NSXKaQon
 mKcirOUHh6vtw7MHSOhZO3NHx927LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180100

On 11/18/25 1:29 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 18 Nov 2025 12:30:37 +0100, David Heidelberg wrote:
>> Add compatible for used LG panel.
>> SW43408 is not panel, but DDIC. The panel itself is the
>> LG LH546WF1-ED01, so introduce combined compatible for it.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../devicetree/bindings/display/panel/lg,sw43408.yaml         | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible:0: 'lg,sw43408' is not one of ['lg,sw43408-lh546wf1-ed01']
> 	from schema $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/lg,sw43408.example.dtb: panel@0 (lg,sw43408): compatible: ['lg,sw43408'] is too short

You got this error because you didn't fix the example DT (which would be
validated with `make dt_binding_check`

Konrad
