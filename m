Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118841;
	b=S6GjK4dBZROGPXqzX7LFgD/fhm6Bx9IfNerH6eFrk+7ww4aX1KbpeIm7BVyju1+kNwvD
	 zpZibI0CLcrO+8PVTf6t0D00rwgRqL3iEKz3m60aw2zHoDaW+lQ5WpeQwEmydD/xSfPfP
	 XLbOyNzCdUZz78xdsu0XlBpx7YqRCq1i+qL8bEKaQbwJqmdSLLz1cWxAca8Q/xOXyzsIg
	 cZ+xdBZTGhS3wHfga02ev0LLrL6NlAGaOtrF7DR5bbPhbRl5PCrOv2+XKAVPXKLvpUEBB
	 QIBnDUXinKx3AgdVdP0L7jA582kSnpgsB3S/oLk9zwgNF2ErT+XSS8w9iFD5jrNr31Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
	b=1HMv44Km9xbbf356hVi/FSxGK3xaDx/H4HBzyLcksbfrFWSAJEPVUaO4AOQ3BZX8BkYK
	 Dl7jyT/0Itve0otlLBFs2d1w7DxGFML6eWeQ2KlpZAyyHNOtxFcJU2uZ9yEEhmccG/pv3
	 +KxvADQA6KKkvPEyjPoWGbKE0pjnPA8zIQxLUbc+Foj/A/thJnT1NsIuFItuE4xJzjouy
	 wPVgQZUeyzIihx3l3VVG1yPSS35gXuA/tqsuLH1yNkmWGnWx1c3MM/gqBjrxJUpkisPhp
	 fX3uy+XC+Q8PjHbfVMqeCX2sGs/ndMM4drQ5D5/kYZJ/mBtoWs2nEGJowUw9uu5c2WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDsh1nvR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E5A606A31D
	for <phone-devel@vger.kernel.org>; Tue, 27 Oct 2026 16:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDsh1nvR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKu5E1521248
	for <phone-devel@vger.kernel.org>; Tue, 27 Oct 2026 16:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=; b=U6pJPW1a9PcPo0tq
	HaV0IZjrwONB2IQ8bzDs7E6/FnePQJ2g1yuYzIeylDAxd2zPmi3gAfb5mVOJCC/S
	kH9fipkT6AiMxzac2Ft6xTvMY1VPJ/q8ugfBq3A9HctgWvpfrCPORejVHcEz2zil
	JkcFK+z6ylbkuRUlYc+o0moz4R9bwUwXc79smGrvPRDWzDGq5iNA7aaq7OgaquxW
	AcxV1b4PI3I2W++lPG3MTM9RDPCRXZU6hE+utM4Wh3FDwgxnl3kjg3QAVHif3q1J
	ctmKvMbbDQ3mxBTxd++p+SnsoFdaQ3gC1q6Xl2J9QXVfnh6RhaqjHQfURMNC1LGy
	o9eRKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux994gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 27 Oct 2026 16:33:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so719102085a.3
        for <phone-devel@vger.kernel.org>; Tue, 27 Oct 2026 09:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118838; cv=none;
        d=google.com; s=arc-20260327;
        b=m86fv7vQ32eIH1uPpO1CO7mlQQTwrqCjDN+Fe9iJR5sbBXsrK9AJr//ArGETvWED4S
         +HdwaqHZ9cy3gHa2/0R1piH4KVsCWxqdH99VGZdHvfgj5I+c7dd1LRxK5wERhBbHwdOy
         JmygGxsp5q4RYTquNQestyz2JfnjZ8SZge+4x4V8jkmxnQ9NP/JZiUoT00Quu5ggM7gj
         vPCERRIwHpylNEIwpYH9oqt9JCJ+fZLra1632Nz1m5V6ts57Wj+faF28DcmTc7oZS/qm
         x2Cq1MXGuDr4l2gCtumhVuQpvqkEDJpFUHcxiAL6hRiUKtGAx624doefd6QpbDf7ll/w
         hclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        fh=B5mCVVBBRTomM4FfiBlyI7gCJTuDTZYKCrpCzkXumNE=;
        b=BUkgZdajCI+NhRl16y76HmXV1lUwMOB/lm8VRHBB+tWswbbY2vSMrF6nASXILOCe77
         kkliWU/eoYP8XxqNUi/LgRJxS4FOYG8HrZPQUTN1LNEU/9pmq3CLTeoyrMnIMn94Wjt8
         ljv1gjQ9Yh6FOY+sCT8lxADTQJKlFr7yVB351Be/r6z0L3aK89TbAVDwkrqrUBSyr/8w
         Lyp7AECkohZIh80m1o01rV0q7tPLX+hghxXXDkPxxbeQ3AJ3S2PdBg80bUenWq3EwpuN
         N1Q0DdiEBCILwUc6gaBxxATErmwy4U8N7+bNQ5kpy0YinnvUwxukojtP4VIsM1Z2coGe
         GGzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793118838; x=1793723638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=GDsh1nvRWiinXQtkuSsj6zMKdAtT8BbL3opnTlAjy1Lt8T859k2r149YTyFNxV/2Jt
         hiV6guMQFK7hJNT+5Q+TQOIiAEi5xQv8CoIxo2w5HHOo4Xtr/zzsqCLJwMz144Ig71x9
         +uBiROCMUFjaCbYdluCj8MhkZgIGjs9meZAlc4kW8KH4XzWZpQxCKHt75v+0H0lIb9a9
         nAyRftrZ5rCmivB3YnIhBpKfy/vQM/9YU69vJ6vvXn8r6/AXI2r9ndaG1onbdhBtNAsY
         peF1VVYA8Uc/F3b7WhPKakgbtFSgy3lHm14OIoQpK76f518DKBmXuxl7Z66n+n3006/Q
         FvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118838; x=1793723638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=D2+l/RrYOvzaPtf1SaibhcLME/YwqkpJGBSVa/pY7udH3jiUj8EQBgXMRCpyBzywd2
         stSBD0wF5smWi29XWDrGi/ZbBrLXYuoo5deqQmXWDJZgrb8+kqlTeSLd48cTzZCQKpzZ
         A/sEOL2lexbV9P48h1dKU47RjteOVhBHqMnIbWkDzretfNBOZdyDbhRM+DJqN5Jj+HGz
         hvTLoThLvmidDa6krooIENoTbp7W4SbazsvrrlhK1NjWScqIdL1FwZmbLiMNUlOtBoPS
         ePQAlSXoKrems9ts78bfDMQGqb52XS2pMdqOzp3hgShHPTnC1vtbv+/RaMt8CRUFnbqW
         RCSg==
X-Forwarded-Encrypted: i=1; AKwUvBzG2QSeGKmNhQX6qTQ9e7/wuQCNHFOiWPjGHgisnuW9tzn+m/645Jnsh4msyzCLkOqVU99TxsIqFU8kFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjsIVgGyoT0aG8MAB5Ah083l1GsHlqRP6C9N2AKOYFYu3JzCZz
	tZhELVknYwZ0c5j/TiyQyoFLvgqf7bxAN+RtdezjqrOX0vQrWj602RUTYQf7bVVGiWBIZTrXVzx
	B3D0l4qcxb5dduNZ84+iuTz1OyfRIbcOBN+D5TWkNv9PsXsbhyO+HvW0zng2z03GVIgreePvssl
	nz5R71hCtyhCX3TJ4r1YgwVTkbnWpkOn2BMTlEmudR
X-Gm-Gg: AYBFou2aYFG2lHUHAl7k1I2tUTvOcWbNmMWKE21PDLkkzV6xVmi1NaI16Il5rX8i2/U
	RqjbidjiIPMfY4f5VwxfeOhqd3ZBiNUFQiBDQp5AEtVCsO1A2KAs+YU1QEWD42y8xQ419qnHkuA
	b8LVVdS5Lx1t+7eLFjlxpl0hyStsREEBZVBsBlSvQIk1g49qiLGC2ygggvpgn+FofoKhv45lR3z
	QR8jzRh3c2JwpQQ0QHmJCPXBaLhJsUtZRH9c7s1fXnLlAmwGiUkoo3lkKWYEuc2BY9SwufR7bx2
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id af79cd13be357-940ef6833d1mr1472843185a.0.1793118838220;
        Tue, 27 Oct 2026 09:33:58 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id
 af79cd13be357-940ef6833d1mr1472839285a.0.1793118837619; Tue, 27 Oct 2026
 09:33:57 -0700 (PDT)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
In-Reply-To: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:33:46 +0100
X-Gm-Features: AclHuK8j4mStUHhryvskQijmxQMRr1T1BTPG7p5KRrujFPF0uIKAlxEAa6i54Sg
Message-ID: <CAFEp6-1N_bUQouuLqLJdLWXx4e4o_8qoKdwa7CD-D9Jxd6MhnQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
To: david@ixit.cz
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0d277 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1LqAIe8ZLxqIxhs1lXgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UDN5HLG1ZlCYlwriURx9WnMGOJZ03exx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX+TQCdbfzP+UR
 4MD1RykOpC005dKHpa0WZiojaLycc8GcQ/cGi6ff65yvJCkCriXWedSvAjFUfcF5ZKdsmfL44bp
 nlXiWIclL4mrdJePwN+oPuexO1pQcv21JiDSLoXEZYfT/umHlRhmTuo+qKzItyjibtJrty5Kumq
 SiRPuCVIt+XH6Hned5ZbSMYBAYBOHe7Ib+kuqKWusB7WTriOaVtH8xkGzMY+H/bQJt+0V6NxNlf
 k2xB3zLVT0VGVKBGJXOGAqXbi0FqMtgUxx7THLnkOtpcnUJ5e0kzp0tu8opCBlDsk+g2NKO5oJt
 BytmG5aKJq5BFb72dDbaA5Ab7EW5RG3SKQKv+eY7dVpzX2BL6d582DRyjF2GbOgeYUrHPtojKYS
 GLMiwXZ9EwcZRvzSNEDd/fElJGX65+OkBF9ybyPI4cGFAMSp0AW4RtCwzGVzvZonfY6reN/LInd
 FMUUpzX2NVTtImiEr4A==
X-Proofpoint-GUID: UDN5HLG1ZlCYlwriURx9WnMGOJZ03exx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX8+WTwLOmPfJF
 kqvKwaAeYt+R8RpwBYVpUex6AN02zgJHB4LyuDBzFAXl1av9T6re415KCvH105CE97qEN7Y1wbk
 y9qfWkGUcro+D/D3L0YCwPrG1oROG18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270065

On Tue, Oct 27, 2026 at 5:15=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> The timer clock has no such relationship to the link rate. Both the 2ph
> and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
> where a faster link makes the settle count smaller, not larger: at
> 269.33 MHz the count converges to 16 as the link rate grows. The vendor
> driver pins the timer to 269.33 MHz for every sensor (it is the highest
> rate in the SDM845 clock plan) and streams this exact link with it.
>
> Clamp to the highest listed rate instead of failing, the same way the
> unknown-link-rate case is already handled.
>
> Solves issue on sdm845 that caps the link at ~1.02 GHz,
> so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
> Pixel clock is too high for CSIPHY
>
> Fixes: bbde31047434 ("media: camss: Use optimal clock frequency rates")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on SHIFT 6MQ with sdm845-next-20260820-9.
> ---
> Changes in v3:
> - Added R-b and Fixes: tag.
> - Link to v2: https://patch.msgid.link/20260914-csiphy-sdm845-limits-v2-1=
-622db5a6ebf0@ixit.cz
>
> Changes in v2:
> - Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
> - Fix the check in camss instead: clamp the timer clock to the highest
>   listed rate rather than failing, matching the vendor driver.
> - Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1=
-d360bf7cd38f@ixit.cz
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef2289..985171276ce47 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -159,25 +159,23 @@ static int csiphy_set_clock_rates_legacy(struct csi=
phy_device *csiphy)
>                         long round_rate;
>
>                         camss_add_clock_margin(&min_rate);
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for CSIP=
HY\n");
> -                               return -EINVAL;
> -                       }
> -
> -                       /* if sensor pixel clock is not available */
> -                       /* set highest possible CSIPHY clock rate */
> -                       if (min_rate =3D=3D 0)
> +                       /*
> +                        * The timer clock is only the reference for the
> +                        * settle count and does not need to track the li=
nk
> +                        * rate. Use the highest listed rate when the lin=
k is
> +                        * faster than the table covers or unknown.`
> +                        */
> +                       if (j =3D=3D clock->nfreqs || min_rate =3D=3D 0)
>                                 j =3D clock->nfreqs - 1;
>
>                         round_rate =3D clk_round_rate(clock->clk, clock->=
freq[j]);
>                         if (round_rate < 0) {
>                                 dev_err(dev, "clk round rate failed: %ld\=
n",
>                                         round_rate);
>                                 return -EINVAL;
>                         }
>
> ---
> base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
